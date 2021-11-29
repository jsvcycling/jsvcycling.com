---
title: "Hugo, GitLab, and Kubernetes"
slug: hugo-gitlab-k8s
date: 2019-10-25T18:35:45-04:00
hasPermalink: true
---

The website you're currently reading is a statically generated site running on a
(small) Kubernetes cluster. It's built using [Hugo][hugo] and deploy
using [GitLab Auto DevOps][gitlab-auto-devops]. At this point you may be start
thinking that I'm crazy. And you may be right, but that's besides the
point. Honestly, there's no real sane answer to why this is a good idea other
than that I wanted to do something with Kubernetes and I also just so happened
to want to rewrite my personal website. And because I'm sure there are other
people out there like me (or there aren't and I'm talking into an abyss) I
decided it might be worth spending a few minutes to share my experience.

Before we start deploying, we need to let GitLab know about our Kubernetes
cluster. This is as simple as going to the "Operations" tab of your GitLab
repository, selecting "Kubernetes", and then clicking on the button labeled "Add
Kubernetes Cluster". I'm going to gloss over how to actually setup the cluster
in GitLab since the GitLab instructions are pretty good. Once you have the
cluster configured, you'll need to install at least the "Helm" and "Ingress"
modules. The Ingress module will display an IP address once it's
configured. You'll need to add this to your DNS provider as an A record along
with the hostname you'd like to use for your cluster. Make sure you also set the
"Base domain" field to match the hostname you set on the DNS provider.

Now that GitLab is connected to Kubernetes, we can start deploying out
website. I'll assume you already have a Hugo site that's ready to be
deployed. If not, go create one now, I'll wait. Done yet? Good. The first thing
we'll need to do is create a `Dockerfile` that will build and publish our
site. Here's a sample one:

```dockerfile
#
# Build
#
FROM alpine:latest AS build

RUN apk add --no-cache hugo git

WORKDIR /site
COPY . .

RUN git submodule update --init && hugo

#
# Deploy
#
FROM nginx:alpine

WORKDIR /usr/share/nginx/html

RUN rm -fr *.??* && sed -i 's/80/5000/g' /etc/nginx/conf.d/default.conf
COPY --from=build /site/public /usr/share/nginx/html

EXPOSE 5000
STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]
```

We can see that the file is broken up into two parts: build and deploy. This is
to limit the size of our deployment image since we don't need git or hugo in
order to run our site using NGINX. On line 20, we also see that we're using
`sed` to replace every occurance of `80` with `5000` in NGINX's default
configuration. This is because GitLab expects containers to expose port `5000`
so we need to update the NGINX configuration file to host the site on `5000`
rather than the more standard `80`.[^1]

With the Dockerfile out of the way, we need to write a `.gitlab-ci.yml` to
override some of the defaults from the Auto DevOps pipeline.

```yaml
include:
  - template: Auto-DevOps.gitlab-ci.yml

.auto-deploy:
  image: "registry.gitlab.com/gitlab-org/cluster-integration/auto-deploy-image:v0.1.0"

.production: &production_template
  extends: .auto-deploy
  stage: production
  script:
    - auto-deploy check_kube_domain
    - auto-deploy download_chart
    - auto-deploy ensure_namespace
    - auto-deploy initialize_tiller
    - auto-deploy create_secret
    - auto-deploy deploy
    - auto-deploy delete canary
    - auto-deploy delete rollout
    - auto-deploy persist_environment_url
  environment:
    name: production
    url: http://example.com
  artifacts:
    paths: [environment_url.txt]


production:
  <<: *production_template
  only:
    refs:
      - master
    kubernetes: active
  except:
    variables:
      - $STAGING_ENABLED
      - $CANARY_ENABLED
      - $INCREMENTAL_ROLLOUT_ENABLED
      - $INCREMENTAL_ROLLOUT_MODE
```

I honestly don't know what most of this stuff does since it was pulled out of
the [GitLab code][gitlab-code] but I know it works. The big thing here is line
22, where we set the deployment URL. This is important because the default value
here is sets it so that the project is deployed to a project-specific subdomain
of the hostname from the "Base domain" field of the Kubernetes cluster page in
GitLab. Sometimes this isn't what we want so we can override it by providing our
own `.gitlab-ci.yml`. Just make sure that whatever value is used in `url`
matches the "Base domain" that was set earlier. Make sure this also matches the
`baseURL` value in the Hugo `config.toml` file. Otherwise, permalinks will not
work.

We're almost ready to start deploying. That last thing that needs to be done is
the testing steps need to be disabled. These steps are great for when the
project contains "actual code" but it will always fail when running on a static
site. To disable these steps, go to "Settings", "CI / CD", and finally in the
"Variables" section, add a new variable for each test step and set the value to
`1`. The different test steps are listed in
the [GitLab documentation][gitlab-test-overrides]. Now when the deployment
pipeline runs, it'll build the Docker image and then go straight to deploying it
to the Kubernetes cluster.

With that done everything should be in place to start deploying. Push the hugo
project to `master` branch and take a look at the "Pipelines" page under "CI /
CD" in the GitLab project to see if a new pipeline has been started. Once it's
completes the production step, it should be available at the URL set in the
`.gitlab-ci.yml`.

While I definitely recommend using GitHub Pages or GitLab Pages[^2] for most use
cases, it's always nice to try something new. Even if it's *far* more powerful
than necessary.

[^1]: It is possible to make the change on the GitLab-side and set the port to be `80` but this appears to be a far more complicated approach.
[^2]: Hugo works on GitLab Pages, albeit without support for SASS compilation.

[hugo]: https://gohugo.io/
[gitlab-auto-devops]: https://about.gitlab.com/product/auto-devops
[gitlab-code]: https://gitlab.com/gitlab-org/gitlab/blob/60ecd1733a1af1660843fa6a0d3194fc015b58e0/lib/gitlab/ci/templates/Jobs/Deploy.gitlab-ci.yml
[gitlab-test-overrides]: https://docs.gitlab.com/ee/topics/autodevops/#disable-jobs

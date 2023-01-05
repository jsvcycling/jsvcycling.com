---
title: Running cgit on AlmaLinux 9 with Nginx
slug: cgit-almalinux9-nginx
date: 2023-01-04
---

Recently I started running my own git server. For years now I've been using a
mixture of GitHub, GitLab, and SourceHut. And while I've been generally been
happy using three different services, I've really been considering setting up
my own git server. A few weeks ago I decided to take the dive and set it up.
This isn't so much a postmortem as much as it is a quick summary of my journey
from zero to a functional git server. It was no easy task.

# What's cgit and Why?

There are really two big players when it comes to self-hostable git platforms:
GitLab and Gitea. I really like GitLab, it's really robust and I love their
CI/CD pipeline system. But it's also really heavy resource-wise. I'm not
running it on a Raspberry Pi but I also don't want to throw a ton a resources
at it when I'm only going to be using a very small subset of its features.
Gitea has fewer features and no built-in CI/CD system, but this means that it's
much lighter[^1]. I was planning to setup a Gitea instance for myself until I
happened to come across [cgit].

Nowadays cgit is a bit of an outside in terms of git web servers, but it's got
quite a number of big names in its corner. Both the [Linux Kernel] and [FreeBSD
Project] use cgit. When looking at cgit though, it's important to consider it's
limitations. It doesn't have "issues", "pull/merge requests", CI/CD, or even
the ability to star, watch, or fork a repository. It's quite literally just a
read-only web frontend for a git repository. It doesn't even require a database
to run, it reads the `.git` directory (or the bare repository equivalent, more
on this later) directly to generate each page.

[^1]: Not to mention that executed as a compiled Go binary as opposed to a full
  Ruby on Rails project.

[cgit]: https://git.zx2c4.com/cgit/about/
[Linux Kernel]: https://git.kernel.org/
[FreeBSD Project]: https://cgit.freebsd.org/

---
title: "A Week with the Moonlander"
date: 2020-11-03T00:00:00
hasPermalink: true
---

Before I begin, I'd like to apologize to anyone who's expecting this post to be
about an actual Moon lander. I'll be discussing the ZSA Moonlander Mark 1
keyboard, not a NASA spacecraft.

Earlier this year, ZSA, the company behind the ErgoDox EZ ergonomic keyboard,
announced the [Moonlander Mark 1](https://www.zsa.io/moonlander/). Based on a
similar design philosophy as the ErgoDox, the Moonlander is more of a
refinement than a brand new product. I'd been wanting to get into ergonomic
keyboards and the ErgoDox EZ was one model that I'd been eyeing for quite some
time. So when they announced the Moonlander, I was pretty excited! But with a
price tag of $365 USD, I was a bit hesitant to dive in.

Up until I purchased the Moonlander, my primary keyboard had been a Rosewill
something-or-other with Cherry MX Brown switches that I bought for $100 on
Amazon. Actually, I bought 2: one for the office and one for my desk at home.
It was the cheapest keyboard I could find with Brown switches and it turned out
to be a pretty decent choice that served me well for a couple of years now at
both locations. However, I wanted to expand my horizons but I wasn't sure if I
was willing to drop $365 into it.

Ultimately, after a month or so of thinking and research, I decided to get the
Moonlander. I chose the black version with Cherry MX Brown switches to match my
Rosewill keyboard. By the time it arrived, I'd almost forgotten that I ordered
it way back in mid-August. So, after a week with it as my daily driver for both
work and leisure, here are my first impressions.

## The Good

Let's start with the good. The first thing I noticed when I unboxed the
Moonlander was its weight. It's got some real heft to it. Each half weighs
about as much as my entire Rosewill keyboard. The build quality seems to be
very good and it feels really solid. The boards have little to no give when I
try to (gently) twist them.

Another really good thing I appreciate is the five rubber pads on the bottom of
each board. They provide quite a bit of friction and do an excellent job of
keeping the boards from moving around[^1].

The RGB backlights are quite nice and the different lighting modes and patterns
are cool and fun to play around with at times. The ability to have full control
of the lighting from the keyboard itself is useful as well if I feel like
dimming the brightness or changing the color to something that better fits the
ambient lighting.

One thing that seems to be somewhat unique to ZSA keyboards (and any board that
runs the QMK firmware) is the concept of layers. In a nutshell, the layer
system allows the typist to press and hold a specific key on the keyboard in
order to activate a set of alternative actions. For example, when I press and
hold the button I have configured to switch to Layer 1 (Layer 0 is the
default), my number row now functions as a row of function keys. This means
that while the Moonlander may have fewer physical keys than a traditional
full-size keyboard, I can still have things like a numpad or audio control keys
by using layers.  Even more impressive, I can set up macro keys that send a
sequence of key codes.  Want to have a single key that executes CTRL-ALT-DELETE
when you press it? You can do that! The possibilities are practically endless
and you can configure your keyboard layout just the way you like it.

Speaking of keyboard layouts, ZSA has developed this incredible web tool called
[Oryx](https://configure.ergodox-ez.com/) that's used to visually configure
your keyboard layout.  Once you're satisfied with your setup, you can "compile"
it and Oryx will generate a .bin file that can be flashed onto your keyboard
using a tool from ZSA called Wally.  Because the layout is written directly to
your keyboard and not stored as a keyboard layout in your computer settings,
you can plug your keyboard into any computer running any operating system and
your layout will follow. Oryx can even generate a .zip file containing some C
source code that can be integrated with the QMK source code, allowing even more
customizability for those who are proficient in C. On top of all that, Oryx
also includes a revision system that stores a history of all the different
iterations of your layouts. It's quite handy if you want to try something out
while still having the option to go back to a previous revision.

One of the main advantages of the split keyboard design is that I can position
the two halves quite far apart. This means that I'm able to keep my hands about
shoulder-width apart rather the tight and close together. While I'm no doctor,
I'm sure that keeping my arms effectively square to my back and straight from
my shoulders down through my wrists reduces strain in several areas of my upper
body. So far I haven't noticed any differences but I'm interested to see if
I'll notice any improvements down the road.

## The Bad

Now that we've gotten the good out of the way let's talk a bit about the bad.
Thankfully I only have a couple of minor complaints with the Moonlander.

The first one I want to point out is the hand rests. When the Moonlander first
arrived, I tested out the hand rests and decided to ditch them. They're made of
hard plastic and have no padding or give whatsoever. I'm glad to see that
they're built in such a sturdy fashion, but they're not exactly the most
comfortable. However part way through the week, I decided to give them another
try. For the moment, I've decided to keep them to position my wrists in a
slightly higher position as well as provide another point of reference for my
hand position. But that's not necessarily the bad part. The bad part is that
the hand rests have a little bit of play to them on the hinge where they attach
to the keyboards. It's a tiny amount and only translates into about 1-2 mm of
lateral motion at the far end of the hand rest, but it's just enough to throw
me off for a moment if I'm in a flow. A slightly tighter tolerance on the hinge
assembly would likely solve the problem but it'll also make it harder to add
and remove the hand rests using the spring-loaded rod.

My other main complaint has to do with the three indicator lights at the top of
each board. While the backlights of all the keys are customizable and can be
turned off, there doesn't seem to be any control over the indicator lights.
There also doesn't seem to be any control over the color of the indicator
lights (which from left to right are green, blue, red). This means that if I'm
working in a dim or dark room, anytime I activate Layer 1, a bright blue light
appears at the top of both halves of the Moonlander and it stays on as long as
I'm on Layer 1. I want to experiment with covering the lights with masking tape
to diffuse the light but I wish there was the ability to control their
intensity with keyboard actions.

One last, incredibly minor, complaint I'd like the point out is that when I set
the RGB to white, the light looks to be more along the lines of light purple
than white. I can't tell if the actual light is causing this or if it's because
of the plastic cover of the switch. I also don't know if this is normal for RGB
backlit keyboards (this is my first one). So if you're looking for a pure white
backlight, you've been warned.

## The Ugly

Switching from a traditional keyboard to an ortholinear split ergonomic
keyboard was quite an undertaking at first. My first few hours with the
keyboard were mentally taxing and I couldn't even type out "hello world"
without making a mistake. I wasn't expecting to be able to switch over without
any hiccups but I don't think I was quite ready for *how* bad I'd be on the
Moonlander. On a traditional keyboard, I generally get 70-80 words per minute
(WPM). The first time I tested on the Moonlander I scored a mere 15 WPM.
However, that quickly rose to around 30 WPM within a day and is hovering around
55 WPM as of writing.  However, the gap feels even wider when coding due to the
nature of needing to type a lot of symbols rather than just words and basic
punctuation.

I never learned to properly touch type and my hands generally move slightly and
my fingers didn't necessarily return to the home row immediately.  I've never
found this to be an issue on a traditional keyboard. But with the ortholinear
layout of the Moonlander, in addition to the two-halves design, my old method
just didn't work out well and I regularly lost track of where my fingers were
located. And when it did work, it was generally only for 1-2 words at a time.
Over the next few weeks I'll be putting some time into learning and practicing
touch typing. I've already put some effort into it so far and I'm starting to
feel the payoff. I definitely feel that my typing is more accurate and I'm able
to go for longer word sequences before I make a mistake.

## The Forgotten

For those of you familiar with the Moonlander, you may have noticed that I
didn't discuss the Moonlander's ability to tilt outwards for a more natural
hand position. When the Moonlander first arrived, I tried out a few different
height settings but at the time I felt that my hands were just a tad too small
to comfortably reach the thumb clusters when it's tilted outwards. I plan to
revisit the tilting function once I get more comfortable on the Moonlander. At
the moment though, I haven't spent enough time with it to have an actual
opinion.

## Conclusion

Overall, I'm delighted with my purchase of the Moonlander. It's a significant
change to how I interface with computers and the initial learning curve feels
rather steep but I think there's a lot to be gained making the switch. The $365
USD price tag is a bit higher than I'd typically want to spend on a keyboard,
but ultimately I think I made the right choice. I'm expecting that as I spend
more time using the Moonlander, my typing rate and efficiency will match or
possibly exceed what I was able to accomplish on a traditional keyboard.

Now I say "was" for a very specific reason. While I expect my performance on
the Moonlander to increase over time, I'm also concerned that my traditional
keyboard performance will start to degrade. This is because I am effectively
reprogramming my brain to be good at the Moonlander. I haven't spent any
significant time on a traditional keyboard since the Moonlander arrived so I
haven't really gotten a chance to observe any degradation there but I'm
definitely expecting it to happen. I'll have to wait and see.

Lastly, for my fellow Moonlander users, feel free to take a look at my keyboard
layout: https://configure.ergodox-ez.com/moonlander/layouts/WWggo/latest/0.

[^1]: When I first setup the Moonlander I noticed that they weren't as "sticky"
  as I'd liked. Cleaning the pads (and my desk) with a little rubbing alcohol
  was able to remedy the problem. I assume that some particulates had
  accumulated on either the pads, my desk, or both and they were reducing the
  effectiveness of the pads.

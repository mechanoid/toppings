[![Build Status](https://travis-ci.org/mechanoid/toppings.png)](https://travis-ci.org/mechanoid/toppings)
[![Coverage Status](https://coveralls.io/repos/mechanoid/toppings/badge.png)](https://coveralls.io/r/mechanoid/toppings)
[![Code Climate](https://codeclimate.com/github/mechanoid/toppings.png)](https://codeclimate.com/github/mechanoid/toppings)
[![Dependency Status](https://gemnasium.com/mechanoid/toppings.png)](https://gemnasium.com/mechanoid/toppings)
[![Gem Version](https://badge.fury.io/rb/toppings.png)](http://badge.fury.io/rb/toppings)

## Welcome to Toppings

The toppings project provides a basic generator set to create and maintain a generic structure for your css based application or framework frontend. Though the structure may be not final yet, it offers a great way of staying clean in your development base and lets you concentrate on the hard and heavy styling itself.

In the last few years a lot of work was done about frontend development via css which includes precompiling frameworks like sass and less and architectural patterns like [BEM](http://bem.info/method/definitions/),  [OOCSS](http://oocss.org/) and [SMACCS](http://smacss.com/) which lead to combined framework definitions like [MVCSS](http://mvcss.github.io/) and [SMURF](http://railslove.com/blog/2012/11/09/taking-sass-to-the-next-level-with-smurf-and-extend).

Aside these ideas we have developed our frontend architecture on similar principles for years now, and did not want to bother anymore about how to name folders and structures in every project again and again. Out of this we tried to combine and compress the basic ideas around the aforementioned principles to some helpful generators, that provides a more or less complete filestructure for your css and some specific generators to add new css components for your modules, settings or even your font files. Unlike the core principles like BEM, OOCSS or SMACSS this framework is based on SASS/SCSS only, because (yeah, obvious i know :)) it is all about structuring/splitting your css code to encapsulated and reusable units.

While we try to make this gem highly configurable in later versions, we want to provide strong defaults, to get your application easily up and running, without fighting with five different grid frameworks, several naming strategies or something like that. But we will try to give you the possibility to easily interchange or disable most of the things, toppings provide.

### Installation

Installing toppings should be easy with standard gem mananig, because it does not carry any native dependencies until now :). So just try to run `gem install toppings` (with sudo, when you are not running without ruby version management) or add the gem to your Gemfile with `gem 'toppings'`.


### Usage

The toppings gem ships with a binary called `topping` which is basically a wrapper for some) [Thor](…)-tasks and provides a similar syntax as the rails binary does for generation tasks.
(As a little side note, keep in mind to run `rbenv rehash` when using rbenv for managing your rubies, to create a binary shim, that links properly to the installed gem.)

But beforementioned there is a command for initializing your stylesheet environment, called via `topping install`. Running this command will read the current configuration (give a look to the configuration section for more information) and then create a folder and file structure like you can see below.

<script src="https://gist.github.com/mechanoid/5856595.js"></script>

At first you may stumble upon the sass format of the generated files, and yes we decided for the sass style of the language as a default here. Let me start with, that this setting for sure will be configurable, so it is really only a default. But lets discuss our decision over SASS vs. SCSS for short. I argued myself very often against the sass style over the newer SCSS (Sassy CSS) format, because it of course looks a lot more like CSS, as it is the case with HAML and HTML. But unlike HTML which is sometimes whitespace sensitive and so it may not make sense to keep a language layer between you and the markup output, arranging CSS rules is mainly about personal preferences. Many best practices about arranging your css rules, like one rule per line do perfectly match the sassy syntax. And in the end you were writing really good and readable stylesheets without the necessity of writing curly brackets over and over again. Enough commercials for the SASS syntax for now we will keep an eye now for the structure itself.

In the root of the stylesheets folder, you'll mention a toppings.sass file (and yes the name is configurable ;))


### Configuration



































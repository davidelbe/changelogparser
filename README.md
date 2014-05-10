# changelog_parser

A ruby gem for creating nice changelogs based on your git commits.

[![Build Status](https://travis-ci.org/davidelbe/changelogparser.svg?branch=master)](https://travis-ci.org/davidelbe/changelogparser)

## Installation

`gem install changelog_parser`

## Usage

Just run `changelog` or `changelog true` in your git directory to print
out a changelog for the last two versions in your gem.

## Changelog formatting in your commits

One way of telling changelog what to display is by writing a commit with
a specific changelog message. This is done by prefixing your message with
_Changelog:_. This means that you can write your technical commit messages
as normal, and just append a more user-friendly changelog message at the end
or skip the message altogether if it was just a minor fix.

```
Update User model with password hash
Changelog: Logins are working again
```

Another option is to skip the changelog messages completely, and just output
the git commit messages by running `changelog true` instead of `changelog`.

## Versions

The gem looks for commits with the message `Version bump to xyz` where
xyz could be any version, for example 2.7.3 or 1.9.3-p274

The [version gem](https://github.com/stouset/version) helps with this,
`rake version:bump` creates a message with the correct format directly.

## Contributing to changelog_parser

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2014 David Elbe. See LICENSE.txt for
further details.

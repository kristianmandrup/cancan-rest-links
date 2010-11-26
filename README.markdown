# CanCan REST links

REST link helpers for the [CanCan](http://github.com/ryanb/cancan) permission system.

## Update:Nov 26, 2010

From changelog:

* Removed dependency to Cream for labels
* Created class methods on CanCan::Links::Rest for handling labels, including translations
* Created a Generator to create a locale file for labels
* Created a spec to test the generator
* Created specs to test the REST link generation with and without label translations

## Rails 3 usage

See the demo app at [CanCan permits demo app](https://github.com/kristianmandrup/cancan-permits-demo)

Configure your Rails 3 app for use with CanCan and some Authentication solution like Authlogic or Devise.

## Use with CanCan permits

[CanCan permits](https://github.com/kristianmandrup/cancan-permits) is a gem that lets you use Permits with CanCan to configure permissions.

## Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2010 Kristian Mandrup. See LICENSE for details.

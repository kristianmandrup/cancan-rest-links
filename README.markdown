# CanCan REST links

REST link helpers for the [CanCan](http://github.com/ryanb/cancan) permission system.

Note: The link helpers require a hash called #auth_labels, which is used to look-up a label to display for the link

<pre>
  label = auth_labels[:new]
  ...
</pre>

An example of this functionality can be found in the [Cream](http://github.com/kristianmandrup/cream) framework where this gem is used.

## Rails 3 usage

See the configure_spec in the /specs folder.

<code>
  require 'cancan-rest-links/rails/configure'  
</code>



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

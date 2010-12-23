# CanCan REST links

REST link helpers for the [CanCan](http://github.com/ryanb/cancan) permission system.

## Rails 3 install

in Gemfile insert:
<pre>
gem 'cancan-rest-links'  
</pre>

Then run <code>$ bundle install</code> from the terminal.

## Rails 3 usage

See the demo app at [CanCan permits demo app](https://github.com/kristianmandrup/cancan-permits-demo)

Configure your Rails 3 app for use with CanCan and some Authentication solution like Authlogic or Devise.

This locale file should be placed in config/locales in your Rails 3 app. The generator will create the above locale file as _cream.en.yml_

## Use with CanCan permits

[CanCan permits](https://github.com/kristianmandrup/cancan-permits) is a gem that lets you use Permits with CanCan to configure permissions.

## REST links

These REST link helpers always check the _current_user_ to see if the user has the required permission access for the required action on the given model. If not, the link is not rendered.

The following is a list of the REST links available and the required CanCan permission level for the model instance(s) that is linked to. 
Note that the CanCan _:manage_ level implies full permission and _:write_ full mutation access.

* Index :read
* Show :read
* Create :create
* Edit :edit
* Delete :destroy

Typically the REST links are used within views, partials and view helpers. Example

<pre>
<%= index_link(Post, 'To the posts') %>
<%= create_link(Post, 'Create a new post') %>
</pre>

For the create and index REST actions, you can pass either an instance or a class of a model object. The other REST options only work with model instances. 

### index_link

<pre>index_link(Post)
index_link(Post, 'To the posts')
index_link(@post)
index_link(@post, 'All the posts')
</pre>

### create_link

<pre>create_link(Post)
create_link(Post, 'Create the post')
create_link(@post)
create_link(@post, 'Create the post')</pre>

### edit_link

<pre>edit_link(@post)
edit_link(@post, 'Edit the post')</pre>

### delete_link

<pre>delete_link(@post)
delete_link(@post, 'Delete the post')</pre>

### show_link

<pre>show_link(@post)
show_link(@post, 'Show the post')</pre>

## Locale file

A locale file with the following structure can be created to define define labels for the various REST actions.

<pre>
en:
  cream:
    confirm: 'Are you sure?'
    actions:
      rest:  
        index: "Index"
        new: "New"
        edit: "Edit"
        delete: "Delete"
        show: "Show"  
</pre>

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

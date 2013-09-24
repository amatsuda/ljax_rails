# LJAX

Lazy-load AJAX on Rails

## Installation

Bundle `ljax_rails` gem:

    gem 'ljax_rails'

Then add this to your app/assets/javascripts/application.js (or whatever bundle you use):

    //=require ljax_rails

## Usage

### Views

Add `remote: true` option to your `render :partial` call, then the partial will be lazily rendered in a separate HTTP request.

    <%= render 'users', remote: true %>

Also, you can give `remote_url` option for specifying request target URL.

    <%= render 'sidebar', remote: true, remote_url: '/shared/sidebar' %>

### Controllers

`request.ljax?` tells you whether the request was sent via LJAX or not.

    def index
      if request.ljax?
        @users = User.all
      end
    end

## TODO

* JS error handling
* JS event hook
* spinner?
* tests
* documentation
* tutorial

## Contributing

Send me your PRs!

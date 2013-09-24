# LJAX

Lazy-load AJAX on Rails

## Installation

Bundle `ljax_rails` gem:

    gem 'ljax_rails'

Then add this to your app/assets/javascripts/application.js (or whatever bundle you use):

    //=require ljax_rails

## Usage

Add `remote: true` option to your `render :partial` call, then the partial will be lazily rendered in a separate HTTP request.

    <%= render 'users', remote: true %>

Also, you can give `remote_url` option for specifying request target URL.

    <%= render 'sidebar', remote: true, remote_url: '/shared/sidebar' %>

## Contributing

Send me your PRs!

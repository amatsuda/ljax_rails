require 'securerandom'

module LjaxRails
  module LjaxRenderer
    def render_partial(context, options, &block)
      if options[:locals] && options[:locals].delete(:remote)
        partial = options.delete :partial
        encrypted_partial = LjaxRails.encryptor.encrypt_and_sign partial

        url = options[:locals].delete :remote_url
        id = "ljax-#{SecureRandom.uuid}"
        loading = block.call if block

        %Q!<div id="#{id}" class="ljax-container" data-ljax-partial="#{encrypted_partial}"#{%Q( data-remote-url="#{url}") if url}>#{loading}</div>!.html_safe
      else
        super
      end
    end
  end
end

ActionView::Renderer.send :prepend, LjaxRails::LjaxRenderer

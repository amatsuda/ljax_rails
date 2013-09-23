require 'securerandom'

module LjaxRails
  module LjaxRenderer
    def render_partial(context, options, &block)
      if options[:locals] && options[:locals].delete(:remote)
        partial = options.delete :partial
        url = options[:locals].delete :url
        id = SecureRandom.uuid
        context.flash[id] = partial
        loading = block.call if block

        context.render text: %Q!<div id="#{id}" class="ljax-container" url="#{url}">#{loading}</div>!.html_safe
      else
        super
      end
    end
  end
end

ActionView::Renderer.send :prepend, LjaxRails::LjaxRenderer

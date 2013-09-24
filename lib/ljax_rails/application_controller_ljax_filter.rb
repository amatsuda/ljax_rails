module LjaxRails::LjaxActionProcessor
  def default_render(*)
    if request.ljax?
      partial = LjaxRails.encryptor.decrypt_and_verify request.headers['X-LJAX-Partial']
      render partial: partial
    else
      super
    end
  end
end

ActionController::Base.send :prepend, LjaxRails::LjaxActionProcessor

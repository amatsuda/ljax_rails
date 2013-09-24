::ActionController::Base.class_eval do
  if Rails::VERSION::MAJOR >= 4
    around_action :handle_ljax
  else
    around_filter :handle_ljax
  end

  private
  def handle_ljax
    if request.ljax?
      render nothing: true
      yield
      self.response_body = nil

      partial = LjaxRails.encryptor.decrypt_and_verify request.headers['X-LJAX-Partial']
      render partial: partial
    else
      yield
    end
  end
end

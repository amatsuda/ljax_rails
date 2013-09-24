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
      render partial: flash[request.headers['X-LJAX-Container']]
    else
      yield
    end
  end
end

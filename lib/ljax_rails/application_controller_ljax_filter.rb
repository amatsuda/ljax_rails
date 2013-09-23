::ActionController::Base.class_eval do
  around_action :handle_ljax

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

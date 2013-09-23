ActionDispatch::Request.class_eval do
  def ljax?
    xhr? && headers['X-LJAX']
  end
end

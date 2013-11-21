class OnlyAjaxRequest
  def matches?(request)
    request.xhr?
  end
end
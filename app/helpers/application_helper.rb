module ApplicationHelper
  def redirection(url, message)
    if message != nil
      redirect_to url, :flash => {:notice => message}
    else
      redirect_to url
    end
  end
end

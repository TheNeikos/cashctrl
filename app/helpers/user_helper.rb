module UserHelper
  def current_user
    if cookies[:session]
      s = Session.find_by_cookie_hash(cookies[:session])
      @_current_user ||= (s && s.user)
    end
    @_current_user
  end

  def logged_in?
    !!current_user
  end
end

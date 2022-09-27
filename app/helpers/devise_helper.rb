module DeviseHelper
  
  def bootstrap_alert(key)
    if key == "notice"
      key = "success"
    else
      key = "danger"
    end
  end
  
  def current_user?(user)
    user == current_user
  end
end
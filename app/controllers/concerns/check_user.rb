module CheckUser
  
  # Check for signed in user
  def signed_in_user
    redirect_to signin_url, alert: "Please sign in." unless signed_in?
  end
  
  # Check for authorized user
  def correct_user
    @user ||= @character.user
    redirect_to user_path(current_user), alert: "That does not belong to you!" unless is_current_user?(@user) || is_admin?
  end
  
  # Check for admin
  def admin_user
    redirect_to user_path(current_user), alert: "You do not have permission to access that page!" unless is_admin?
  end
  
end
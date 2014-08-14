class Guest < User
  protected

  def email_required?
    false
  end

  def password_required?
    false
  end
end
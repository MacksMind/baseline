class Notifier < ActionMailer::Base
  def password_reset_instructions(user)
    subject       "Password Reset Instructions"
    from          Baseline::EmailSender 
    #TODO - Remove when Rails 2.3.6 is released
    headers       "return-path" => Baseline::EmailReturnPath
    recipients    user.email
    sent_on       Time.now
    body          :edit_account_password_reset_url => edit_account_password_reset_url(user.perishable_token)
  end
  
  def account_confirmation_instructions(user)
    subject       "Account Confirmation Instructions"
    from          Baseline::EmailSender 
    #TODO - Remove when Rails 2.3.6 is released
    headers       "return-path" => Baseline::EmailReturnPath
    recipients    user.email
    sent_on       Time.now
    body          :edit_account_confirmation_url => edit_account_confirmation_url(user.perishable_token)
  end
end

class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: true
  validates :phone_number, presence: true, uniqueness:true, length:{is:10}
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }













  def email_or_username
    @email_or_username || self.username || self.email 
    # :username  || :email
  end


  def send_password_reset
	  generate_token(:password_reset_token)
	  self.password_reset_sent_at = Time.zone.now
	  save!
	  UserMailer.forgot_password(self).deliver# This sends an e-mail with a link for the user to reset the password
	end
	# This generates a random password reset token for the user
	def generate_token(column)
	  begin
	    self[column] = SecureRandom.urlsafe_base64
	  end while User.exists?(column => self[column])
	end
end

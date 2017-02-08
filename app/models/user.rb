class User < ActiveRecord::Base
  def User.new_token
    SecureRandom.urlsafe_base64
  end
end

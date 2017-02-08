module CampaignsHelper

  def campaign_banners
    "#{@campaign_id}-banners"
  end
  
  def campaign_idx_to_show
    "#{@campaign_id}-idx_to_show"
  end
  
  def banner
    "banner"
  end
  
  def banner_id
    13
  end
  
  def new_user?
    cookies.permanent[:user_token] == nil
  end
  
  def user_not_in_base?
    User.find_by(token: cookies.permanent[:user_token]) == nil
  end
  
  def create_user
    @user = User.new
    user_token = User.new_token
    @user.update_attribute(:token, user_token)
    cookies.permanent[:user_token] = user_token
  end

end

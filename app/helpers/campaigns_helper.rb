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
    @banners[@idx_to_show]
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
  
  def init_campaign_cookies
    @idx_to_show = 0
    @banners = [*1..5].shuffle
    cookies.permanent[campaign_banners] = @banners
    cookies.permanent[campaign_idx_to_show] = @idx_to_show
  end
  
  def campaign_in_cookies?
    result = cookies.permanent[campaign_idx_to_show] != nil
    result &&= (cookies.permanent[campaign_banners] != nil) 
  end
  
  def get_banner_from_cookies
    @banners = to_array cookies.permanent[campaign_banners]
    @idx_to_show = cookies.permanent[campaign_idx_to_show].to_i
    increment_idx_in_cookies
    init_campaign_cookies unless @idx_to_show < @banners.size
  end

  def to_array(str_array)
    str_array.split("&").map(&:to_i)
  end
  
  def increment_idx_in_cookies
    @idx_to_show += 1
    cookies.permanent[campaign_idx_to_show] = @idx_to_show
  end
  
end

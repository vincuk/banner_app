class CampaignsController < ApplicationController
  def show
    @campaign_id = params[:id]
    if new_user? || user_not_in_base?
      proceed_new_user
    else
      proceed_known_user
    end
    render banner
  end

  def index
  end
  
  private
  
    def proceed_new_user
      create_user
      init_campaign_cookies
    end
    
    def proceed_known_user
      if campaign_in_cookies?
        get_banner_from_cookies
      else
        init_campaign_cookies
      end
    end
end

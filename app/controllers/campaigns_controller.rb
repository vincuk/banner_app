class CampaignsController < ApplicationController
  def show
    @campaign_id = params[:id]
    if Impression.empty_campaign?(@campaign_id)
      render error_message
    else
      proceed_request
      render banner
    end

  end

  def index
  end
  
  private
  
    def proceed_request
      if new_user? || user_not_in_base?
        proceed_new_user
      else
        proceed_known_user
      end
    end 
  
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

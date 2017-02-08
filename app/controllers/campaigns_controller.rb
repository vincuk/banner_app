class CampaignsController < ApplicationController
  def show
    @campaign_id = params[:id]
    if new_user? || user_not_in_base?
      create_user
    end
    render banner
  end

  def index
  end
end

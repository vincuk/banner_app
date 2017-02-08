class CampaignsController < ApplicationController
  def show
    @campaign_id = params[:id]
    render banner
  end

  def index
  end
end

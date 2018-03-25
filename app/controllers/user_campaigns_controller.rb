class UserCampaignsController < ApplicationController
  before_action :set_user_campaign, only: [:show, :edit, :update, :destroy]

  # GET /user_campaigns
  # GET /user_campaigns.json
  def index
    @user_campaigns = UserCampaign.all
  end

  # GET /user_campaigns/1
  # GET /user_campaigns/1.json
  def show
  end

  # GET /user_campaigns/new
  def new
    @user_campaign = UserCampaign.new
  end

  # GET /user_campaigns/1/edit
  def edit
  end

  # POST /user_campaigns
  # POST /user_campaigns.json
  def create
    @user_campaign = UserCampaign.new(user_campaign_params)

    respond_to do |format|
      if @user_campaign.save
        format.html { redirect_to @user_campaign, notice: 'User campaign was successfully created.' }
        format.json { render :show, status: :created, location: @user_campaign }
      else
        format.html { render :new }
        format.json { render json: @user_campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_campaigns/1
  # PATCH/PUT /user_campaigns/1.json
  def update
    respond_to do |format|
      if @user_campaign.update(user_campaign_params)
        format.html { redirect_to @user_campaign, notice: 'User campaign was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_campaign }
      else
        format.html { render :edit }
        format.json { render json: @user_campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_campaigns/1
  # DELETE /user_campaigns/1.json
  def destroy
    @user_campaign.destroy
    respond_to do |format|
      format.html { redirect_to users_tenant_campaign_url(id: @user_campaign.campaign_id,
        tenant_id: @user_campaign.campaign.tenant_id),
        notice: 'User was successfully removed from the campaign' }
        format.json { head :no_content }
      end
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_campaign
      @user_campaign = UserCampaign.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_campaign_params
      params.require(:user_campaign).permit(:campaign_id, :user_id)
    end
end

class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show, :edit, :update, :destroy, :users, :add_user]
  before_action :set_tenant, only: [:show, :edit, :update, :destroy, :new, :create, :users, :add_user]
  before_action :verify_tenant

  # GET /campaigns
  # GET /campaigns.json
  def index
    @campaigns = Campaign.by_user_plan_and_tenant(params[:tenant_id], current_user)
  end

  # GET /campaigns/1
  # GET /campaigns/1.json
  def show
  end

  # GET /campaigns/new
  def new
    @campaign = Campaign.new
    @campaign.users << current_user
  end

  # GET /campaigns/1/edit
  def edit
  end

  # POST /campaigns
  # POST /campaigns.json
  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.users << current_user

    respond_to do |format|
      if @campaign.save
        format.html { redirect_to root_url, notice: 'Campaign was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /campaigns/1
  # PATCH/PUT /campaigns/1.json
  def update
    respond_to do |format|
      if @campaign.update(campaign_params)
        format.html { redirect_to root_url, notice: 'Campaign was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /campaigns/1
  # DELETE /campaigns/1.json
  def destroy
    @campaign.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Campaign was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def users
    @campaign_users = (@campaign.users + (User.where(tenant_id: @tenant.id, is_admin: true))) - [current_user]
    @other_users = @tenant.users.where(is_admin: false) - (@campaign_users + [current_user])
  end

  def add_user
    @campaign_user = UserCampaign.new(user_id: params[:user_id], campaign_id: @campaign.id)
    respond_to do |format|
      if @campaign_user.save
        format.html { redirect_to users_tenant_campaign_url(id: @campaign.id,
        tenant_id: @campaign.tenant_id),
        notice: 'User was successfully added to campaign' }
      else
        format.html { redirect_to users_tenant_campaign_url(id: @campaign.id,
        tenant_id: @campaign.tenant_id),
        error: 'User was not added to campaign' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign
      @campaign = Campaign.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def campaign_params
      params.require(:campaign).permit(:title, :description, :tenant_id)
    end

    def set_tenant
      @tenant = Tenant.find(params[:tenant_id])
    end

    def verify_tenant
      unless params[:tenant_id] == Tenant.current_tenant_id.to_s
        redirect_to :root,
        flash: { error: 'You are not authorized to access any organization other than your own'}
      end
    end

end

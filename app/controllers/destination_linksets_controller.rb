class DestinationLinksetsController < ApplicationController
  before_action :set_destination_linkset, only: [:show, :edit, :update, :destroy]

  # GET /destination_linksets
  # GET /destination_linksets.json
  def index
    @destination_linksets = DestinationLinkset.all
  end

  # GET /destination_linksets/1
  # GET /destination_linksets/1.json
  def show
  end

  # GET /destination_linksets/new
  def new
    @destination_linkset = DestinationLinkset.new
  end

  # GET /destination_linksets/1/edit
  def edit
  end

  # POST /destination_linksets
  # POST /destination_linksets.json
  def create
    @destination_linkset = DestinationLinkset.new(destination_linkset_params)

    respond_to do |format|
      if @destination_linkset.save
        format.html { redirect_to @destination_linkset, notice: 'Destination linkset was successfully created.' }
        format.json { render :show, status: :created, location: @destination_linkset }
      else
        format.html { render :new }
        format.json { render json: @destination_linkset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /destination_linksets/1
  # PATCH/PUT /destination_linksets/1.json
  def update
    respond_to do |format|
      if @destination_linkset.update(destination_linkset_params)
        format.html { redirect_to @destination_linkset, notice: 'Destination linkset was successfully updated.' }
        format.json { render :show, status: :ok, location: @destination_linkset }
      else
        format.html { render :edit }
        format.json { render json: @destination_linkset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /destination_linksets/1
  # DELETE /destination_linksets/1.json
  def destroy
    @destination_linkset.destroy
    respond_to do |format|
      format.html { redirect_to linkset_url(id: @destination_linkset.linkset_id,
        campaign_id: @destination_linkset.linkset.campaign_id),
        notice: 'Destination was successfully removed from the linkset' }
      format.json { head :no_content }

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_destination_linkset
      @destination_linkset = DestinationLinkset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def destination_linkset_params
      params.require(:destination_linkset).permit(:linkset_id, :destination_id)
    end
end

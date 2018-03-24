class SourceLinksetsController < ApplicationController
  before_action :set_source_linkset, only: [:show, :edit, :update, :destroy]

  # GET /source_linksets
  # GET /source_linksets.json
  def index
    @source_linksets = SourceLinkset.all
  end

  # GET /source_linksets/1
  # GET /source_linksets/1.json
  def show
  end

  # GET /source_linksets/new
  def new
    @source_linkset = SourceLinkset.new
  end

  # GET /source_linksets/1/edit
  def edit
  end

  # POST /source_linksets
  # POST /source_linksets.json
  def create
    @source_linkset = SourceLinkset.new(source_linkset_params)

    respond_to do |format|
      if @source_linkset.save
        format.html { redirect_to @source_linkset, notice: 'Source linkset was successfully created.' }
        format.json { render :show, status: :created, location: @source_linkset }
      else
        format.html { render :new }
        format.json { render json: @source_linkset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /source_linksets/1
  # PATCH/PUT /source_linksets/1.json
  def update
    respond_to do |format|
      if @source_linkset.update(source_linkset_params)
        format.html { redirect_to @source_linkset, notice: 'Source linkset was successfully updated.' }
        format.json { render :show, status: :ok, location: @source_linkset }
      else
        format.html { render :edit }
        format.json { render json: @source_linkset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /source_linksets/1
  # DELETE /source_linksets/1.json
  def destroy
    @source_linkset.destroy
    respond_to do |format|
      format.html { redirect_to linkset_url(id: @source_linkset.linkset_id,
        campaign_id: @source_linkset.linkset.campaign_id),
        notice: 'Source was successfully removed from the linkset' }
      format.json { head :no_content }

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_source_linkset
      @source_linkset = SourceLinkset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def source_linkset_params
      params.require(:source_linkset).permit(:linkset_id, :source_id)
    end
end

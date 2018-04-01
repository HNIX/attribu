class LinksetsController < ApplicationController
  layout "profile", only: [:show]

  before_action :set_linkset, only: [:show, :edit, :update, :destroy, :add_destination, :destinations, :add_source, :sources, :create_links]
  after_action :create_links, only: [:create, :update, :add_destination, :add_source]
  # GET /linksets
  # GET /linksets.json
  def index
    @linksets = Linkset.all
  end

  # GET /linksets/1
  # GET /linksets/1.json
  def show
  end

  # GET /linksets/new
  def new
    @linkset = Linkset.new
    @linkset.campaign_id = params[:campaign_id]
  end

  # GET /linksets/1/edit
  def edit
  end

  # POST /linksets
  # POST /linksets.json
  def create
    @linkset = Linkset.new(linkset_params)

    respond_to do |format|
      if @linkset.save
        format.html { redirect_to @linkset, notice: 'Linkset was successfully created.' }
        format.json { render :show, status: :created, location: @linkset}
      else
        format.html { render :new }
        format.json { render json: @linkset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /linksets/1
  # PATCH/PUT /linksets/1.json
  def update
    respond_to do |format|
      if @linkset.update(linkset_params)
        format.html { redirect_to tenant_campaign_url(tenant_id: Tenant.current_tenant_id, id: @linkset.campaign_id), notice: 'Linkset was successfully destroyed.' }
      else
        format.html { render :edit }
        format.json { render json: @linkset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /linksets/1
  # DELETE /linksets/1.json
  def destroy
    @linkset.destroy
    respond_to do |format|
      format.html { redirect_to linksets_url, notice: 'Linkset was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def destinations
    @linkset_destinations = @linkset.destinations
    @other_destinations = Destination.all - (@linkset_destinations)
  end

  def add_destination
    @linkset_destination = DestinationLinkset.new(destination_id: params[:destination_id], linkset_id: @linkset.id)
    respond_to do |format|
      if @linkset_destination.save
        format.html { redirect_to linkset_url(id: @linkset.id),
        notice: 'Destination was successfully added to linkset' }
      else
        format.html { redirect_to linkset_url(id: @linkset.id),
        error: 'Destination was not added to linkset' }
      end
    end
  end

  def sources
    @linkset_sources = @linkset.sources
    @other_sources = Source.all - (@linkset_sources)
  end

  def add_source
    @linkset_source = SourceLinkset.new(source_id: params[:source_id], linkset_id: @linkset.id)
    respond_to do |format|
      if @linkset_source.save
        format.html { redirect_to linkset_url(id: @linkset.id),
        notice: 'Source was successfully added to linkset' }
      else
        format.html { redirect_to linkset_url(id: @linkset.id),
        error: 'Source was not added to linkset' }
      end
    end
  end

  def create_links
    @linkset.destination_linksets.each do |destination_linkset|
      @linkset.source_linksets.each do |source_linkset|
        @link = Link.where(destination_linkset_id: destination_linkset.id, linkset_id: @linkset.id, source_linkset_id: source_linkset.id).first_or_create
        @link.save
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.


    def set_linkset
      @linkset = Linkset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def linkset_params
      params.require(:linkset).permit(:name, :campaign_id, destination_ids:[], destinations_attributes: [:name, :url], source_ids:[], sources_attributes: [:name, :medium, :url])
    end
end

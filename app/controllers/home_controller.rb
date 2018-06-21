class HomeController < ApplicationController
  skip_before_action :authenticate_tenant!, :only => [ :index ]
  helper_method :sort_column, :sort_direction

  def index
    if current_user
      if session[:tenant_id]
        Tenant.set_current_tenant session[:tenant_id]
      else
        Tenant.set_current_tenant( current_user.tenants.first )
      end

      @tenant = Tenant.current_tenant
      @campaigns = Campaign.by_user_plan_and_tenant(@tenant.id, current_user).order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 5)
      params[:tenant_id] = @tenant.id
    end

  end

  private

  def sort_column
    Campaign.column_names.include?(params[:sort]) ? params[:sort] : "title"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end

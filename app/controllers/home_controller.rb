class HomeController < ApplicationController
  skip_before_action :authenticate_tenant!, :only => [ :index ]

  def index
    if current_user
      if session[:tenant_id]
        Tenant.set_current_tenant session[:tenant_id]
      else
        Tenant.set_current_tenant( current_user.tenants.first.tenant_id )
      end

      @tenant = Tenant.current_tenant
      @campaigns = Campaign.by_user_plan_and_tenant(@tenant, current_user)
      params[:tenant_id] = @tenant.id
    end

  end

end

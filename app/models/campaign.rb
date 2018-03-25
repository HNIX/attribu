class Campaign < ApplicationRecord
  belongs_to :tenant
  has_many :linksets, dependent: :destroy
  has_many :user_campaigns
  has_many :users, through: :user_campaigns

  validates_uniqueness_of :title
  validate :free_plan_can_only_have_one_campaign

  def free_plan_can_only_have_one_campaign
    if self.new_record? && (tenant.campaigns.count > 0) && (tenant.plan == 'free')
      errors.add(:base, "Free plans cannot have more than one campaign")
    end
  end

  def self.by_user_plan_and_tenant(tenant_id, user)
    tenant = Tenant.find(tenant_id)

    if tenant.plan == 'premium'
      if user.is_admin?
        tenant.campaigns
      else
        user.campaigns.where(tenant_id: tenant.id)
      end
    else
      if user.is_admin?
        tenant.campaigns.order(:id).limit(1)
      else
        user.campaigns.where(tenant_id: tenant.id).order(:id).limit(1)
      end
    end
  end

end

class Campaign < ApplicationRecord
  belongs_to :tenant
  has_many :linksets, dependent: :destroy

  validates_uniqueness_of :title
  validate :free_plan_can_only_have_one_campaign

  def free_plan_can_only_have_one_campaign
    if self.new_record? && (tenant.campaigns.count > 0) && (tenant.plan == 'free')
      errors.add(:base, "Free plans cannot have more than one campaign")
    end
  end

  def self.by_plan_and_tenant(tenant_id)
    tenant = Tenant.find(tenant_id)

    if tenant.plan == 'premium'
      tenant.campaigns
    else
      tenant.campaigns.order(:id).limit(1)
    end

  end
end

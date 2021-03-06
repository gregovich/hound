class Repo < ActiveRecord::Base
  has_many :memberships
  has_many :users, through: :memberships
  has_many :builds

  has_one :subscription

  alias_attribute :name, :full_github_name

  delegate :type, :price, to: :plan, prefix: true
  delegate :price, to: :subscription, prefix: true

  validates :full_github_name, presence: true
  validates :github_id, uniqueness: true, presence: true

  def self.active
    where(active: true)
  end

  def self.find_or_create_with(attributes)
    repo = where(github_id: attributes[:github_id]).first_or_initialize
    repo.update_attributes(attributes)
    repo
  end

  def activate
    update(active: true)
  end

  def deactivate
    update(active: false)
  end

  def plan
    Plan.new(self)
  end

  def stripe_subscription_id
    if subscription
      subscription.stripe_subscription_id
    end
  end

  def exempt?
    ENV["EXEMPT_ORGS"] && ENV["EXEMPT_ORGS"].split.include?(organization)
  end

  private

  def organization
    if full_github_name
      full_github_name.split("/").first
    end
  end
end

class Application < ActiveRecord::Base
  attr_accessible :description, :name, :status, :group_ids
  validates :name, presence: true
  has_and_belongs_to_many :groups
  has_and_belongs_to_many :users

  def is_subscribed?(user)
    self.users.include?(user)
  end
end

class Group < ActiveRecord::Base
  attr_accessible :name, :status
  validates :name, presence: true

  has_and_belongs_to_many :applications
end

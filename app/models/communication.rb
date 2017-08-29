class Communication < ActiveRecord::Base
  attr_accessible :description, :save_as_template, :sub_title, :title
  validates :title, :sub_title, :description, presence: true
end

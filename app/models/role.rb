class Role < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  has_and_belongs_to_many :users


  # Setup accessible (or protected) attributes for your model
  attr_accessible :name
  
end

require 'csv'
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name

  attr_accessor :file_upload

  has_and_belongs_to_many :roles
  has_and_belongs_to_many :applications
  
  # attr_accessible :title, :body
  after_create :update_user_role

  def update_user_role
  	self.roles << Role.find_by_name('user')
  	self.save
  end

  def is_admin?
  	roles.include?(Role.find_by_name('admin'))
  end

  def is_super_admin?
  	roles.include?(Role.find_by_name('super_admin'))
  end

  def is_user?
  	roles.include?(Role.find_by_name('user'))
  end

  def self.import(file)
    ::CSV.foreach(file.path, headers:true) do |row|
      u = User.new(row.to_hash)
      u.password = "Welcome2017"
      u.save
    end
  end

  

end

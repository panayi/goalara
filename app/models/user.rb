class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :fullname, :email, :password, :password_confirmation, :remember_me
  
  has_and_belongs_to_many :roles
  
  acts_as_voter
  
  belongs_to :team
  
  has_many :comments
  
  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token['extra']['user_hash']
    if user = User.find_by_email(data["email"])
      user
    else # Create a user with a stub password. 
      User.create(:email => data["email"], :password => Devise.friendly_token[0,20]) 
    end
  end
  
  def role?(role)
      return !!self.roles.find_by_name(role.to_s.camelize)
  end
  
  
end

class Team < ActiveRecord::Base
  
  has_and_belongs_to_many :organizations
  has_and_belongs_to_many :article
  
end

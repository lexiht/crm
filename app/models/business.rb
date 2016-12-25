class Business < ApplicationRecord
  has_many :workshops
  has_many :users
end

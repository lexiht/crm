class Workshop < ApplicationRecord
  belongs_to :business
  has_many :projects
  has_many :users
end

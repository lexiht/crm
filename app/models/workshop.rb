class Workshop < ApplicationRecord
  belongs_to :business
  has_many :projects
end

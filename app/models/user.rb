class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :business
  belongs_to :workshop

  def admin?
    self.role == "admin"
  end

  def staff?
    self.role == "staff"
  end

end

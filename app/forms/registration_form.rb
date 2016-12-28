class RegistrationForm < Reform::Form
  include Composition

  property :name, on: :business
  property :address, on: :business
  property :phone, on: :business

  property :email, on: :user
  property :password, on: :user
  property :password_confirmation, on: :user, empty: true

  model :user

  validates :email, presence: true
  validates :password, presence: true, confirmation: true
  validates :password, length: { minimum: 8 }
  validates :name, presence: true

  def active_for_authentication?
    true
  end

  def authenticable_salt
  end

  def save
    # return false unless valid?
    sync
    business = model[:business]
    if business.save!
      user = model[:user]
      user.save
    end
  end
end

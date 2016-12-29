class RegistrationForm < Reform::Form
  include Composition

  property :company_name, on: :business
  property :address, on: :business
  property :phone, on: :business
  property :email, on: :user
  property :password, on: :user
  property :password_confirmation, on: :user

  model User

  validates :email, presence: true
  validates :password,  presence: true, confirmation: true
  validates :password, length: { minimum: 6 }
  validates :company_name, presence: true

  def active_for_authentication?
    true
  end

  def authenticatable_salt
  end

  def persisted?
    true
  end

  def get_user
    model[:user]
  end

  def save
    return false unless valid?
    sync
    business = model[:business]
    if business.save
      user = model[:user]
      user.business = business
      user.save
    end
  end
end

class RegistrationForm < Reform::Form
  include Composition

  property :name, on: :business
  property :email, on: :user
  property :password, on: :user
  property :password_confirmation, on: :user

  model User

  validates :email, presence: true
  validates :password,  presence: true, confirmation: true
  validates :password, length: { minimum: 6 }
  validates :name, presence: true

  def active_for_authentication?
    true
  end

  def authenticatable_salt; end

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

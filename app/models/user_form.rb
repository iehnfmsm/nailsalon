class UserForm
  include ActiveModel::Model

  attr_accessor :name, :email, :encrypted_password, :birthday

  with_options presence: true do
    validates :name
    validates :email
    validates :encrypted_password
    validates :birthday
  end

  def save
    User.create(name: name, email: email, encrypted_password: encrypted_password, birthday: birthday)
end
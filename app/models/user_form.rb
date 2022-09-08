class UserForm
  include ActiveModel::Model

  attr_accessor :name, :email, :password, :birthday, :password_confirmation, :user_memo

  with_options presence: true do
    validates :name
    validates :email
    validates :password
    validates :birthday
    validates :password_confirmation
  end

  def save
    User.create(name: name, email: email, password: password, password_confirmation: password_confirmation, birthday: birthday, user_memo: user_memo)
  end
end
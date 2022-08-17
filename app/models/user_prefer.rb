class UserPrefer < ApplicationRecord
  belongs_to :user
  belongs_to :prefer
end

class UserPrefer < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions 
  belongs_to :user
  belongs_to_active_hash :prefer
  accepts_nested_attributes_for :user, allow_destroy: true
end

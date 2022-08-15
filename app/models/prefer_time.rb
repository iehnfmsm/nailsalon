class PreferTime < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '10:20 〜 12:20' },
    { id: 3, name: '13:30 〜 15:30' },
    { id: 4, name: '16:30 〜 18:30' },
    { id: 5, name: '18:30 〜 20:30' }
  ]

  include ActiveHash::Associations
  has_many :prefers
  has_many
end

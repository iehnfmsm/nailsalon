class Prefer < ActiveHash::Base
  self.data = [
    { id: 1, wday: '月曜日１', time: '10:30 ~ 12:30' },
    { id: 2, wday: '月曜日２', time: '13:30 ~ 15:30' },
    { id: 3, wday: '月曜日３', time: '16:30 ~ 18:30' },
    { id: 4, wday: '月曜日４', time: '18:30 ~ 20:30' },
    { id: 5, wday: '火曜日１', time: '10:30 ~ 12:30'},
    { id: 6, wday: '火曜日２', time: '13:30 ~ 15:30' },
    { id: 7, wday: '火曜日３', time: '16:30 ~ 18:30' },
    { id: 8, wday: '火曜日４', time: '18:30 ~ 20:30' },
    { id: 9, wday: '水曜日１', time: '10:30 ~ 12:30'},
    { id: 10, wday: '水曜日２', time: '13:30 ~ 15:30' },
    { id: 11, wday: '水曜日３', time: '16:30 ~ 18:30' },
    { id: 12, wday: '水曜日４', time: '18:30 ~ 20:30' },
    { id: 13, wday: '木曜日１', time: '10:30 ~ 12:30'},
    { id: 14, wday: '木曜日２', time: '13:30 ~ 15:30' },
    { id: 15, wday: '木曜日３', time: '16:30 ~ 18:30' },
    { id: 16, wday: '木曜日４', time: '18:30 ~ 20:30' },
    { id: 17, wday: '金曜日１', time: '10:30 ~ 12:30'},
    { id: 18, wday: '金曜日２', time: '13:30 ~ 15:30' },
    { id: 19, wday: '金曜日３', time: '16:30 ~ 18:30' },
    { id: 20, wday: '金曜日４', time: '18:30 ~ 20:30' }
  ]

  include ActiveHash::Associations
  has_many :user_prefers
  has_many :users, through: :user_prefers

  def users
    user_prefer.map(&:user)
  end
end

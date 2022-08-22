class Reservation < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions 

  validates :date, presence: true
  validates :prefer_id, presence: true

  belongs_to :user
  belongs_to :prefer


  validate :date_before_start
  validate :date_current_today
  validate :date_three_month_end

  def date_before_start
    errors.add(:date, "は過去の日付は選択できません") if date < Date.current
  end
  
  def date_current_today
    errors.add(:date, "は当日は選択できません。予約画面から正しい日付を選択してください。") if date < (Date.current + 1)
  end

  def date_three_month_end
    errors.add(:date, "は3ヶ月以降の日付は選択できません") if (Date.current >> 3) < date
  end


  def self.check_reservation_day(day)
    if day < Date.current
      return "過去の日付は選択できません。正しい日付を選択してください。"
    elsif day < (Date.current + 1)
      return "当日は選択できません。正しい日付を選択してください。"
    elsif (Date.current >> 3) < day
      return "3ヶ月以降の日付は選択できません。正しい日付を選択してください。"
    end
  end



  def self.reservations_after_three_month
    # 今日から3ヶ月先までのデータを取得
    reservations = Reservation.all.where("date >= ?", Date.current).where("date < ?", Date.current >> 3).order(date: :desc)
    # 配列を作成し、データを格納
    # DBアクセスを減らすために必要なデータを配列にデータを突っ込んでます
    reservation_data = []
    reservations.each do |reservation|
    reservations_hash = {}
    reservations_hash.merge!(date: reservation.date.strftime("%Y-%m-%d"), time: reservation.prefer.time, name: reservation.user.name, id:reservation.id)
    reservation_data.push(reservations_hash)
    end
    reservation_data
  end

end

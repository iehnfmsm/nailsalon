module ReservationsHelper
  def times
    times = ["10:30 ~ 12:30",
             "13:30 ~ 15:30",
             "16:30 ~ 18:30",
             "18:30 ~ 20:30"
]
  end

  def check_reservation(reservations, day, time)
    result = false
    reservations_count = reservations.count
    # 取得した予約データにdayとtimeが一致する場合はtrue,一致しない場合はfalseを返します
    if reservations_count > 1
      reservations.each do |reservation|
        result = reservation[:date].eql?(day.strftime("%Y-%m-%d")) && reservation[:time].eql?(time)
        return result if result
      end
    elsif reservations_count == 1
      result = reservations[0][:date].eql?(day.strftime("%Y-%m-%d")) && reservations[0][:time].eql?(time)
      return result if result
    end
    return result
  end

  def check_name(reservations, day, time)
    result = false
    reservations_count = reservations.count
    # 取得した予約データにdayとtimeが一致する場合はtrue,一致しない場合はfalseを返します
    if reservations_count > 1
      reservations.each do |reservation|
        result = reservation[:date].eql?(day.strftime("%Y-%m-%d")) && reservation[:time].eql?(time)
        return reservation if result
      end
    else
      result = reservations[0][:date].eql?(day.strftime("%Y-%m-%d")) && reservations[0][:time].eql?(time)
      return reservations[0] if result
    end
  end
end

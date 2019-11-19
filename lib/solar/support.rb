module Support
  HOURS_PER_DAY = 24
  MINUTES_PER_DAY = 1440
  SECONDS_PER_DAY = 86_400
  JULIAN_DAY_NUMBER_FOR_2000 = 2_451_545
  DAYS_PER_CENTURY = 36_525

  def julian_day_rational(datetime)
    # This computes JD with precision of seconds and yields smaller denominators
    datetime = datetime.utc
    datetime.to_date.ajd + Rational(datetime.hour, HOURS_PER_DAY) + Rational(datetime.min, MINUTES_PER_DAY) + Rational(datetime.sec, SECONDS_PER_DAY)
  end

  def julian_day_float(datetime)
    datetime.to_datetime.utc.ajd.to_f
  end

  def to_radians(degrees)
    degrees * Math::PI / 180.0
  end

  def to_degrees(radians)
    radians * 180.0 / Math::PI
  end

  # Julian day to Julian Centuries since J2000.0
  # t as Julian centuries of 36525 ephemeris days form the epoch J2000.0
  def to_julian_centuries(t)
    julian_day = julian_day_rational(t)

    julian_days_since_2000(julian_day) / DAYS_PER_CENTURY
  end

  def julian_days_since_2000(julian_day)
    julian_day - JULIAN_DAY_NUMBER_FOR_2000
  end
end

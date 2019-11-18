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
  def to_julian_centuries(t)
    julian_day = julian_day_rational(t)

    julian_days_since_2000(julian_day) / DAYS_PER_CENTURY
  end

  def julian_days_since_2000(julian_day)
    julian_day - JULIAN_DAY_NUMBER_FOR_2000
  end

  # Solar equatorial coordinates / Low accuracy : Meeus pg 151
  # returns [declination in radians, right ascension in radians]
  def equatorial_position(datetime)
    # t as Julian centuries of 36525 ephemeris days form the epoch J2000.0
    julian_centuries = to_julian_centuries(datetime)

    # Geometric mean longitude of the Sun, referred to the mean equinox of the date
    l = 280.46645 + (36_000.76983 + 0.0003032*julian_centuries)*julian_centuries

    # Mean anomaly of the Sun
    m_deg = 357.52910 + (35_999.05030 - (0.0001559 + 0.00000048*julian_centuries)*julian_centuries)*julian_centuries
    m_rad = to_radians(m_deg)

    # Sun's Equation of the center
    c = (1.914600 - (0.004817 + 0.000014*julian_centuries)*julian_centuries)*Math.sin(m_rad) +
    (0.019993 - 0.000101*julian_centuries)*Math.sin(2*m_rad) +
    0.000290*Math.sin(3*m_rad)

    # Sun's true longitude
    o = l + c

    # Reduce magnitude to minimize errors
    o %= 360

    # Sun's apparent Longitude
    omega_deg = 125.04 - 1934.136*julian_centuries
    omega_rad = to_radians(omega_deg)
    lambda_deg = o - 0.00569 - 0.00478 * Math.sin(omega_rad)

    # Reduce magnitude to minimize errors
    lambda_deg %= 360

    lambda_rad = to_radians(lambda_deg)

    # Obliquity of the ecliptic
    epsilon_deg = 23.4392966666667 -
    (0.012777777777777778 + (0.00059/60 - 0.00059/60*julian_centuries)*julian_centuries)*julian_centuries +
    0.00256*Math.cos(omega_rad)
    epsilon_rad = to_radians(epsilon_deg)

    # Sun's declination
    delta_rad = Math.asin(Math.sin(epsilon_rad) * Math.sin(lambda_rad))

    # Sun's right ascension
    alpha_rad = Math.atan2(
      Math.cos(epsilon_rad) * Math.sin(lambda_rad),
      Math.cos(lambda_rad)
    )

    right_ascension = to_degrees(alpha_rad)

    return {
      right_ascension: right_ascension,
      declination: delta_rad,
    }
  end
end

include Support

module Solar
  class Position
    def initialize(datetime = nil, latitude, longitude)
      @datetime = datetime
      @latitude = latitude
      @longitude = longitude
    end

    def azimuth
      # azimuth in degrees measured clockwise (towards East) from North direction
      raw_azimuth = to_degrees(
        azimuth_rad(latitude_in_radians, equatorial_position.declination, hour_angle_in_radians)
      )

      (180 + raw_azimuth) % 360
    end

    def altitude
      # Local horizontal coordinates : Meeus pg 89
      # altitude in degrees; positive upwards
      @altitude = to_degrees(
        altitude_rad(latitude_in_radians, equatorial_position.declination, hour_angle_in_radians)
      )
    end

    private

    attr_reader :datetime, :latitude, :longitude

    def latitude_in_radians
      @latitude_in_radians ||= to_radians(latitude)
    end

    def hour_angle_in_radians
      @hour_angle_in_radians ||= to_radians(hour_angle(equatorial_position.right_ascension))
    end

    def equatorial_position
      @equatorial_position ||= EquatorialCoordinates.new(datetime)
    end

    def hour_angle(right_ascension)
      hour_angle = sidereal_time + longitude - to_degrees(right_ascension)
      hour_angle %= 360
    end

    def sidereal_time
      # A sidereal day measures the rotation of Earth relative to the stars rather than the sun.
      # It helps astronomers keep time and know where to point their telescopes without worrying
      # about where Earth is in its orbit.
      # A sidereal day – 23 hours 56 minutes and 4.1 seconds – is the amount of time needed to complete one rotation.
      julian_day = julian_day_rational(datetime)
      # datetime as Julian centuries of 36525 ephemeris days form the epoch J2000.0
      julian_centuries = to_julian_centuries(datetime)

      time_at_greenwich = 280.46061837 + 360.98564736629 * julian_days_since_2000(julian_day) + (0.000387933 - julian_centuries/38_710_000) * julian_centuries * julian_centuries
      # Reduce magnitude to minimize errors
      time_at_greenwich %= 360
    end

    def altitude_rad(latitude_in_radians, declination, hour_angle_in_radians)
      Math.asin(
        Math.sin(latitude_in_radians) * Math.sin(declination) +
        Math.cos(latitude_in_radians) * Math.cos(declination) * Math.cos(hour_angle_in_radians)
      )
    end

    def azimuth_rad(latitude_in_radians, declination, hour_angle_in_radians)
      Math.atan2(
        Math.sin(hour_angle_in_radians),
        Math.cos(hour_angle_in_radians) * Math.sin(latitude_in_radians) -
        Math.tan(declination) * Math.cos(latitude_in_radians)
      )
    end
  end
end

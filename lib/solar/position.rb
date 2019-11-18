include Support

module Solar
  class Position
    attr_reader :altitude, :azimuth

    def self.calculate(datetime, latitude, longitude)
      new(datetime, latitude, longitude).calculate
    end

    def initialize(datetime, latitude, longitude)
      @datetime = datetime
      @latitude = latitude
      @longitude = longitude
    end

    # Sun horizontal coordinates (relative position) in degrees:
    def calculate
      calculated_position = equatorial_position(datetime)
      right_ascension = calculated_position[:right_ascension]
      declination = calculated_position[:declination]

      latitude_rad = to_radians(latitude)
      hour_angle_rad = to_radians(hour_angle(right_ascension))

      # Local horizontal coordinates : Meeus pg 89
      # altitude in degrees; positive upwards
      @altitude = to_degrees(
        altitude_rad(latitude_rad, declination, hour_angle_rad)
      )
      # azimuth in degrees measured clockwise (towards East) from North direction
       azimuth_start = to_degrees(
        azimuth_rad(latitude_rad, declination, hour_angle_rad)
      )
      @azimuth = (180 + azimuth_start) % 360
      self
    end

    private

    attr_reader :datetime, :latitude, :longitude

    def hour_angle(right_ascension)
      hour_angle = sidereal_time + longitude - right_ascension
      hour_angle %= 360
    end

    def sidereal_time
      julian_day = julian_day_rational(datetime)
      # datetime as Julian centuries of 36525 ephemeris days form the epoch J2000.0
      julian_centuries = to_julian_centuries(datetime)

      time_at_greenwich = 280.46061837 + 360.98564736629 * julian_days_since_2000(julian_day) + (0.000387933 - julian_centuries/38_710_000)*julian_centuries*julian_centuries
      # Reduce magnitude to minimize errors
      time_at_greenwich %= 360
    end

    def altitude_rad(latitude_rad, declination, hour_angle_rad)
      Math.asin(
        Math.sin(latitude_rad) * Math.sin(declination) +
        Math.cos(latitude_rad) * Math.cos(declination) * Math.cos(hour_angle_rad)
      )
    end

    def azimuth_rad(latitude_rad, declination, hour_angle_rad)
      Math.atan2(
        Math.sin(hour_angle_rad),
        Math.cos(hour_angle_rad) * Math.sin(latitude_rad) -
        Math.tan(declination) * Math.cos(latitude_rad)
      )
    end
  end
end

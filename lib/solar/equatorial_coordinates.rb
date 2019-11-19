include Support

# The equatorial coordinate system is basically the projection of the latitude and longitude coordinate
# system we use here on Earth, onto the celestial sphere. By direct analogy, lines of latitude become
# lines of declination (Dec; measured in degrees, arcminutes and arcseconds) and indicate how far north
# or south of the celestial equator (defined by projecting the Earth’s equator onto the celestial sphere)
# the object lies. Lines of longitude have their equivalent in lines of right ascension (RA), but whereas
# longitude is measured in degrees, minutes and seconds east the Greenwich meridian, RA is measured in
# hours, minutes and seconds east from where the celestial equator intersects the ecliptic (the vernal
# equinox).
class EquatorialCoordinates
  # Low accuracy : Meeus pg 151
  def initialize(datetime)
    @datetime = datetime
  end

  def declination
    # in radians
    @declination ||= Math.asin(Math.sin(ecliptic_obliquity) * Math.sin(apparent_solar_longitude))
  end

  def right_ascension
    # in radians
    @right_ascension ||= Math.atan2(
      Math.cos(ecliptic_obliquity) * Math.sin(apparent_solar_longitude),
      Math.cos(apparent_solar_longitude)
    )
  end

  private

  attr_reader :datetime

  def geometric_mean_solar_longitude
    # Geometric mean longitude of the Sun, referred to the mean equinox of the date
    # aka mean equinox of the date
    @geometric_mean_solar_longitude ||=
      280.46645 + (36_000.76983 + 0.0003032 * julian_centuries) * julian_centuries
  end

  def mean_solar_anomoly
    @mean_solar_anomoly ||= begin
      m_deg = 357.52910 + (35_999.05030 - (0.0001559 + 0.00000048 * julian_centuries) * julian_centuries) * julian_centuries
      to_radians(m_deg)
    end
  end

  def julian_centuries
    @julian_centuries ||= to_julian_centuries(datetime)
  end

  def equation_of_solar_center
    @equation_of_solar_center ||=
      (1.914600 - (0.004817 + 0.000014 * julian_centuries) * julian_centuries) *
        Math.sin(mean_solar_anomoly) + (0.019993 - 0.000101 * julian_centuries) *
        Math.sin(2 * mean_solar_anomoly) + 0.000290 * Math.sin(3 * mean_solar_anomoly)
  end

  def true_solar_longitude
    @true_solar_longitude ||= (geometric_mean_solar_longitude + equation_of_solar_center) % 360
  end

  def omega_rad
    @omega_rad ||= begin
      omega_deg = 125.04 - 1934.136 * julian_centuries
      to_radians(omega_deg)
    end
  end

  def apparent_solar_longitude
    @apparent_solar_longitude ||= begin
      apparent_longitude = (true_solar_longitude - 0.00569 - 0.00478 * Math.sin(omega_rad)) % 360

      to_radians(apparent_longitude)
    end
  end

  def ecliptic_obliquity
    @ecliptic_obliquity ||= begin
      epsilon_deg = 23.4392966666667 -
      (0.012777777777777778 + (0.00059 / 60 - 0.00059 / 60 * julian_centuries) * julian_centuries) * julian_centuries +
      0.00256 * Math.cos(omega_rad)

      to_radians(epsilon_deg)
    end
  end
end

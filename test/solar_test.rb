require 'helper'

class TestSolar < Minitest::Test
  def test_position
    spring_equinox = DateTime.new(2019, 3, 20, 15, 30)
    summer_solstice = DateTime.new(2019, 6, 21, 15, 30)
    fall_equinox = DateTime.new(2019, 9, 23, 15, 30)
    winter_solstice = DateTime.new(2019, 12, 22, 15, 30)

    boston = { latitude: 42.3601, longitude: -71.0589 }
    quito = { latitude: 0.1807, longitude: -78.4678 }
    reykjavik = { latitude: 64.1466, longitude: -21.9426 }
    richmond = { latitude: 37.5407, longitude: -77.4360 }
    santa = { latitude: 90.0000, longitude: -135.000 }

    assert_in_delta 151.04, Solar.position(spring_equinox, boston[:longitude], boston[:latitude])[:azimuth], 1
    assert_in_delta 43.55, Solar.position(spring_equinox, boston[:longitude], boston[:latitude])[:altitude], 1
    assert_in_delta 134.22, Solar.position(summer_solstice, boston[:longitude], boston[:latitude])[:azimuth], 1
    assert_in_delta 65.38, Solar.position(summer_solstice, boston[:longitude], boston[:latitude])[:altitude], 1
    assert_in_delta 156.10, Solar.position(fall_equinox, boston[:longitude], boston[:latitude])[:azimuth], 1
    assert_in_delta 45.12, Solar.position(fall_equinox, boston[:longitude], boston[:latitude])[:altitude], 1
    assert_in_delta 162.06, Solar.position(winter_solstice, boston[:longitude], boston[:latitude])[:azimuth], 1
    assert_in_delta 22.15, Solar.position(winter_solstice, boston[:longitude], boston[:latitude])[:altitude], 1

    assert_in_delta 90.91, Solar.position(spring_equinox, quito[:longitude], quito[:latitude])[:azimuth], 1
    assert_in_delta 62.05, Solar.position(spring_equinox, quito[:longitude], quito[:latitude])[:altitude], 1
    assert_in_delta 45.93, Solar.position(summer_solstice, quito[:longitude], quito[:latitude])[:azimuth], 1
    assert_in_delta 55.40, Solar.position(summer_solstice, quito[:longitude], quito[:latitude])[:altitude], 1
    assert_in_delta 90.33, Solar.position(fall_equinox, quito[:longitude], quito[:latitude])[:azimuth], 1
    assert_in_delta 65.98, Solar.position(fall_equinox, quito[:longitude], quito[:latitude])[:altitude], 1
    assert_in_delta 135.36, Solar.position(winter_solstice, quito[:longitude], quito[:latitude])[:azimuth], 1
    assert_in_delta 55.77, Solar.position(winter_solstice, quito[:longitude], quito[:latitude])[:altitude], 1

    assert_in_delta 211.11, Solar.position(spring_equinox, reykjavik[:longitude], reykjavik[:latitude])[:azimuth], 1
    assert_in_delta 22.30, Solar.position(spring_equinox, reykjavik[:longitude], reykjavik[:latitude])[:altitude], 1
    assert_in_delta 220.41, Solar.position(summer_solstice, reykjavik[:longitude], reykjavik[:latitude])[:azimuth], 1
    assert_in_delta 44.76, Solar.position(summer_solstice, reykjavik[:longitude], reykjavik[:latitude])[:altitude], 1
    assert_in_delta 215.30, Solar.position(fall_equinox, reykjavik[:longitude], reykjavik[:latitude])[:azimuth], 1
    assert_in_delta 21.65, Solar.position(fall_equinox, reykjavik[:longitude], reykjavik[:latitude])[:altitude], 1
    assert_in_delta 208.20, Solar.position(winter_solstice, reykjavik[:longitude], reykjavik[:latitude])[:azimuth], 1
    assert_in_delta (-0.47), Solar.position(winter_solstice, reykjavik[:longitude], reykjavik[:latitude])[:altitude], 1

    assert_in_delta 140.38, Solar.position(spring_equinox, richmond[:longitude], richmond[:latitude])[:azimuth], 1
    assert_in_delta 44.77, Solar.position(spring_equinox, richmond[:longitude], richmond[:latitude])[:altitude], 1
    assert_in_delta 115.76, Solar.position(summer_solstice, richmond[:longitude], richmond[:latitude])[:azimuth], 1
    assert_in_delta 64.12, Solar.position(summer_solstice, richmond[:longitude], richmond[:latitude])[:altitude], 1
    assert_in_delta 145.13, Solar.position(fall_equinox, richmond[:longitude], richmond[:latitude])[:azimuth], 1
    assert_in_delta 46.92, Solar.position(fall_equinox, richmond[:longitude], richmond[:latitude])[:altitude], 1
    assert_in_delta 155.22, Solar.position(winter_solstice, richmond[:longitude], richmond[:latitude])[:azimuth], 1
    assert_in_delta 24.85, Solar.position(winter_solstice, richmond[:longitude], richmond[:latitude])[:altitude], 1

    assert_in_delta 95.51, Solar.position(spring_equinox, santa[:longitude], santa[:latitude])[:azimuth], 1
    assert_in_delta 0.26, Solar.position(spring_equinox, santa[:longitude], santa[:latitude])[:altitude], 1
    assert_in_delta 97.02, Solar.position(summer_solstice, santa[:longitude], santa[:latitude])[:azimuth], 1
    assert_in_delta 23.48, Solar.position(summer_solstice, santa[:longitude], santa[:latitude])[:altitude], 1
    assert_in_delta 99.44, Solar.position(fall_equinox, santa[:longitude], santa[:latitude])[:azimuth], 1
    assert_in_delta 0.52, Solar.position(fall_equinox, santa[:longitude], santa[:latitude])[:altitude], 1
    assert_in_delta 97.98, Solar.position(winter_solstice, santa[:longitude], santa[:latitude])[:azimuth], 1
    assert_in_delta (-23.41), Solar.position(winter_solstice, santa[:longitude], santa[:latitude])[:altitude], 1

  end
end

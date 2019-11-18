module Solar
  RSpec.describe Solar do
    it "calculates the azimuth and altitude" do
      spring_equinox = DateTime.new(2019, 3, 20, 15, 30)
      summer_solstice = DateTime.new(2019, 6, 21, 15, 30)
      fall_equinox = DateTime.new(2019, 9, 23, 15, 30)
      winter_solstice = DateTime.new(2019, 12, 22, 15, 30)

      boston = { latitude: 42.3601, longitude: -71.0589 }
      quito = { latitude: 0.1807, longitude: -78.4678 }
      reykjavik = { latitude: 64.1466, longitude: -21.9426 }
      richmond = { latitude: 37.5407, longitude: -77.4360 }
      santa = { latitude: 90.0000, longitude: -135.000 }

      expect(Solar.position(spring_equinox, boston[:longitude], boston[:latitude])[:azimuth]).to be_within(1).of(151.04)
      expect(Solar.position(spring_equinox, boston[:longitude], boston[:latitude])[:altitude]).to be_within(1).of(43.55)
      expect(Solar.position(summer_solstice, boston[:longitude], boston[:latitude])[:azimuth]).to be_within(1).of(134.22)
      expect(Solar.position(summer_solstice, boston[:longitude], boston[:latitude])[:altitude]).to be_within(1).of(65.38)
      expect(Solar.position(fall_equinox, boston[:longitude], boston[:latitude])[:azimuth]).to be_within(1).of(156.10)
      expect(Solar.position(fall_equinox, boston[:longitude], boston[:latitude])[:altitude]).to be_within(1).of(45.12)
      expect(Solar.position(winter_solstice, boston[:longitude], boston[:latitude])[:azimuth]).to be_within(1).of(162.06)
      expect(Solar.position(winter_solstice, boston[:longitude], boston[:latitude])[:altitude]).to be_within(1).of(22.15)

      expect(Solar.position(spring_equinox, quito[:longitude], quito[:latitude])[:azimuth]).to be_within(1).of(90.91)
      expect(Solar.position(spring_equinox, quito[:longitude], quito[:latitude])[:altitude]).to be_within(1).of(62.05)
      expect(Solar.position(summer_solstice, quito[:longitude], quito[:latitude])[:azimuth]).to be_within(1).of(45.93)
      expect(Solar.position(summer_solstice, quito[:longitude], quito[:latitude])[:altitude]).to be_within(1).of(55.40)
      expect(Solar.position(fall_equinox, quito[:longitude], quito[:latitude])[:azimuth]).to be_within(1).of(90.33)
      expect(Solar.position(fall_equinox, quito[:longitude], quito[:latitude])[:altitude]).to be_within(1).of(65.98)
      expect(Solar.position(winter_solstice, quito[:longitude], quito[:latitude])[:azimuth]).to be_within(1).of(135.36)
      expect(Solar.position(winter_solstice, quito[:longitude], quito[:latitude])[:altitude]).to be_within(1).of(55.77)

      expect(Solar.position(spring_equinox, reykjavik[:longitude], reykjavik[:latitude])[:azimuth]).to be_within(1).of(211.11)
      expect(Solar.position(spring_equinox, reykjavik[:longitude], reykjavik[:latitude])[:altitude]).to be_within(1).of(22.30)
      expect(Solar.position(summer_solstice, reykjavik[:longitude], reykjavik[:latitude])[:azimuth]).to be_within(1).of(220.41)
      expect(Solar.position(summer_solstice, reykjavik[:longitude], reykjavik[:latitude])[:altitude]).to be_within(1).of(44.76)
      expect(Solar.position(fall_equinox, reykjavik[:longitude], reykjavik[:latitude])[:azimuth]).to be_within(1).of(215.30)
      expect(Solar.position(fall_equinox, reykjavik[:longitude], reykjavik[:latitude])[:altitude]).to be_within(1).of(21.65)
      expect(Solar.position(winter_solstice, reykjavik[:longitude], reykjavik[:latitude])[:azimuth]).to be_within(1).of(208.20)
      expect(Solar.position(winter_solstice, reykjavik[:longitude], reykjavik[:latitude])[:altitude]).to be_within(1).of((-0.47))

      expect(Solar.position(spring_equinox, richmond[:longitude], richmond[:latitude])[:azimuth]).to be_within(1).of(140.38)
      expect(Solar.position(spring_equinox, richmond[:longitude], richmond[:latitude])[:altitude]).to be_within(1).of(44.77)
      expect(Solar.position(summer_solstice, richmond[:longitude], richmond[:latitude])[:azimuth]).to be_within(1).of(115.76)
      expect(Solar.position(summer_solstice, richmond[:longitude], richmond[:latitude])[:altitude]).to be_within(1).of(64.12)
      expect(Solar.position(fall_equinox, richmond[:longitude], richmond[:latitude])[:azimuth]).to be_within(1).of(145.13)
      expect(Solar.position(fall_equinox, richmond[:longitude], richmond[:latitude])[:altitude]).to be_within(1).of(46.92)
      expect(Solar.position(winter_solstice, richmond[:longitude], richmond[:latitude])[:azimuth]).to be_within(1).of(155.22)
      expect(Solar.position(winter_solstice, richmond[:longitude], richmond[:latitude])[:altitude]).to be_within(1).of(24.85)

      expect(Solar.position(spring_equinox, santa[:longitude], santa[:latitude])[:azimuth]).to be_within(1).of(95.51)
      expect(Solar.position(spring_equinox, santa[:longitude], santa[:latitude])[:altitude]).to be_within(1).of(0.26)
      expect(Solar.position(summer_solstice, santa[:longitude], santa[:latitude])[:azimuth]).to be_within(1).of(97.02)
      expect(Solar.position(summer_solstice, santa[:longitude], santa[:latitude])[:altitude]).to be_within(1).of(23.48)
      expect(Solar.position(fall_equinox, santa[:longitude], santa[:latitude])[:azimuth]).to be_within(1).of(99.44)
      expect(Solar.position(fall_equinox, santa[:longitude], santa[:latitude])[:altitude]).to be_within(1).of(0.52)
      expect(Solar.position(winter_solstice, santa[:longitude], santa[:latitude])[:azimuth]).to be_within(1).of(97.98)
      expect(Solar.position(winter_solstice, santa[:longitude], santa[:latitude])[:altitude]).to be_within(1).of((-23.41))
    end
  end
end

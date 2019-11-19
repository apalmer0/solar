module Solar
  RSpec.describe Position do
    let(:time) { nil }
    let(:spring_equinox) { DateTime.new(2019, 3, 20, 15, 30) }
    let(:summer_solstice) { DateTime.new(2019, 6, 21, 15, 30) }
    let(:fall_equinox) { DateTime.new(2019, 9, 23, 15, 30) }
    let(:winter_solstice) { DateTime.new(2019, 12, 22, 15, 30) }

    let(:boston) { { latitude: 42.3601, longitude: -71.0589 } }
    let(:quito) { { latitude: 0.1807, longitude: -78.4678 } }
    let(:reykjavik) { { latitude: 64.1466, longitude: -21.9426 } }
    let(:richmond) { { latitude: 37.5407, longitude: -77.4360 } }
    let(:north_pole) { { latitude: 90.0000, longitude: -135.000 } }

    subject(:position) { Position.new(time, city[:latitude], city[:longitude]) }

    context "boston" do
      let(:city) { boston }

      its(:equinox_angle) { should be_within(0.5).of(47.64) }
      # actual: 47.39 -- 47.68

      context "spring equinox" do
        let(:time) { spring_equinox }

        its(:azimuth) { should be_within(0.5).of(151.04) }
        its(:altitude) { should be_within(0.5).of(43.55) }
      end

      context "summer_solstice" do
        let(:time) { summer_solstice }

        its(:azimuth) { should be_within(0.5).of(134.22) }
        its(:altitude) { should be_within(0.5).of(65.38) }
      end

      context "fall_equinox" do
        let(:time) { fall_equinox }

        its(:azimuth) { should be_within(0.5).of(156.10) }
        its(:altitude) { should be_within(0.5).of(45.12) }
      end

      context "winter_solstice" do
        let(:time) { winter_solstice }

        its(:azimuth) { should be_within(0.5).of(162.06) }
        its(:altitude) { should be_within(0.5).of(22.15) }
      end
    end

    context "quito" do
      let(:city) { quito }

      its(:equinox_angle) { should be_within(0.5).of(89.82) }
      # actual: 89.55 -- 89.85

      context "spring equinox" do
        let(:time) { spring_equinox }

        its(:azimuth) { should be_within(0.5).of(90.91) }
        its(:altitude) { should be_within(0.5).of(62.05) }
      end

      context "summer_solstice" do
        let(:time) { summer_solstice }

        its(:azimuth) { should be_within(0.5).of(45.93) }
        its(:altitude) { should be_within(0.5).of(55.40) }
      end

      context "fall_equinox" do
        let(:time) { fall_equinox }

        its(:azimuth) { should be_within(0.5).of(90.33) }
        its(:altitude) { should be_within(0.5).of(65.98) }
      end

      context "winter_solstice" do
        let(:time) { winter_solstice }

        its(:azimuth) { should be_within(0.5).of(135.36) }
        its(:altitude) { should be_within(0.5).of(55.77) }
      end
    end

    context "reykjavik" do
      let(:city) { reykjavik }

      its(:equinox_angle) { should be_within(0.5).of(25.85) }
      # actual: 25.62 -- 25.92

      context "spring equinox" do
        let(:time) { spring_equinox }

        its(:azimuth) { should be_within(0.5).of(211.11) }
        its(:altitude) { should be_within(0.5).of(22.30) }
      end

      context "summer_solstice" do
        let(:time) { summer_solstice }

        its(:azimuth) { should be_within(0.5).of(220.41) }
        its(:altitude) { should be_within(0.5).of(44.76) }
      end

      context "fall_equinox" do
        let(:time) { fall_equinox }

        its(:azimuth) { should be_within(0.5).of(215.30) }
        its(:altitude) { should be_within(0.5).of(21.65) }
      end

      context "winter_solstice" do
        let(:time) { winter_solstice }

        its(:azimuth) { should be_within(0.5).of(208.20) }
        its(:altitude) { should be_within(0.5).of((-0.47)) }
      end
    end

    context "richmond" do
      let(:city) { richmond }

      its(:equinox_angle) { should be_within(0.5).of(52.46) }
      # actual: 52.20 -- 52.50

      context "spring equinox" do
        let(:time) { spring_equinox }

        its(:azimuth) { should be_within(0.5).of(140.38) }
        its(:altitude) { should be_within(0.5).of(44.77) }
      end

      context "summer_solstice" do
        let(:time) { summer_solstice }

        its(:azimuth) { should be_within(0.5).of(115.76) }
        its(:altitude) { should be_within(0.5).of(64.12) }
      end

      context "fall_equinox" do
        let(:time) { fall_equinox }

        its(:azimuth) { should be_within(0.5).of(145.13) }
        its(:altitude) { should be_within(0.5).of(46.92) }
      end

      context "winter_solstice" do
        let(:time) { winter_solstice }

        its(:azimuth) { should be_within(0.5).of(155.22) }
        its(:altitude) { should be_within(0.5).of(24.85) }
      end
    end

    context "north_pole" do
      let(:city) { north_pole }

      its(:equinox_angle) { should be_within(0.5).of(0) }
      # actual: 0.34 -- 0.59

      context "spring equinox" do
        let(:time) { spring_equinox }

        its(:azimuth) { should be_within(0.5).of(95.51) }
        its(:altitude) { should be_within(0.5).of(0.26) }
      end

      context "summer_solstice" do
        let(:time) { summer_solstice }

        its(:azimuth) { should be_within(0.5).of(97.02) }
        its(:altitude) { should be_within(0.5).of(23.48) }
      end

      context "fall_equinox" do
        let(:time) { fall_equinox }

        its(:azimuth) { should be_within(0.5).of(99.44) }
        its(:altitude) { should be_within(0.5).of(0.37) }
      end

      context "winter_solstice" do
        let(:time) { winter_solstice }

        its(:azimuth) { should be_within(0.5).of(97.98) }
        its(:altitude) { should be_within(0.5).of((-23.41)) }
      end
    end
  end
end

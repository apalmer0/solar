module Solar
  RSpec.describe Position do
    let(:spring_equinox) { DateTime.new(2019, 3, 20, 15, 30) }
    let(:summer_solstice) { DateTime.new(2019, 6, 21, 15, 30) }
    let(:fall_equinox) { DateTime.new(2019, 9, 23, 15, 30) }
    let(:winter_solstice) { DateTime.new(2019, 12, 22, 15, 30) }

    let(:boston) { { latitude: 42.3601, longitude: -71.0589 } }
    let(:quito) { { latitude: 0.1807, longitude: -78.4678 } }
    let(:reykjavik) { { latitude: 64.1466, longitude: -21.9426 } }
    let(:richmond) { { latitude: 37.5407, longitude: -77.4360 } }
    let(:north_pole) { { latitude: 90.0000, longitude: -135.000 } }

    let(:position) { Position.calculate(time, city[:latitude], city[:longitude]) }

    context "boston" do
      let(:city) { boston }

      context "spring equinox" do
        let(:time) { spring_equinox }

        it "calculates the azimuth and altitude" do
          expect(position.azimuth).to be_within(1).of(151.04)
          expect(position.altitude).to be_within(1).of(43.55)
        end
      end

      context "summer_solstice" do
        let(:time) { summer_solstice }

        it "calculates the azimuth and altitude" do
          expect(position.azimuth).to be_within(1).of(134.22)
          expect(position.altitude).to be_within(1).of(65.38)
        end
      end

      context "fall_equinox" do
        let(:time) { fall_equinox }

        it "calculates the azimuth and altitude" do
          expect(position.azimuth).to be_within(1).of(156.10)
          expect(position.altitude).to be_within(1).of(45.12)
        end
      end

      context "winter_solstice" do
        let(:time) { winter_solstice }

        it "calculates the azimuth and altitude" do
          expect(position.azimuth).to be_within(1).of(162.06)
          expect(position.altitude).to be_within(1).of(22.15)
        end
      end
    end

    context "quito" do
      let(:city) { quito }

      context "spring equinox" do
        let(:time) { spring_equinox }

        it "calculates the azimuth and altitude" do
          expect(position.azimuth).to be_within(1).of(90.91)
          expect(position.altitude).to be_within(1).of(62.05)
        end
      end

      context "summer_solstice" do
        let(:time) { summer_solstice }

        it "calculates the azimuth and altitude" do
          expect(position.azimuth).to be_within(1).of(45.93)
          expect(position.altitude).to be_within(1).of(55.40)
        end
      end

      context "fall_equinox" do
        let(:time) { fall_equinox }

        it "calculates the azimuth and altitude" do
          expect(position.azimuth).to be_within(1).of(90.33)
          expect(position.altitude).to be_within(1).of(65.98)
        end
      end

      context "winter_solstice" do
        let(:time) { winter_solstice }

        it "calculates the azimuth and altitude" do
          expect(position.azimuth).to be_within(1).of(135.36)
          expect(position.altitude).to be_within(1).of(55.77)
        end
      end
    end

    context "reykjavik" do
      let(:city) { reykjavik }

      context "spring equinox" do
        let(:time) { spring_equinox }

        it "calculates the azimuth and altitude" do
          expect(position.azimuth).to be_within(1).of(211.11)
          expect(position.altitude).to be_within(1).of(22.30)
        end
      end

      context "summer_solstice" do
        let(:time) { summer_solstice }

        it "calculates the azimuth and altitude" do
          expect(position.azimuth).to be_within(1).of(220.41)
          expect(position.altitude).to be_within(1).of(44.76)
        end
      end

      context "fall_equinox" do
        let(:time) { fall_equinox }

        it "calculates the azimuth and altitude" do
          expect(position.azimuth).to be_within(1).of(215.30)
          expect(position.altitude).to be_within(1).of(21.65)
        end
      end

      context "winter_solstice" do
        let(:time) { winter_solstice }

        it "calculates the azimuth and altitude" do
          expect(position.azimuth).to be_within(1).of(208.20)
          expect(position.altitude).to be_within(1).of((-0.47))
        end
      end
    end

    context "richmond" do
      let(:city) { richmond }

      context "spring equinox" do
        let(:time) { spring_equinox }

        it "calculates the azimuth and altitude" do
          expect(position.azimuth).to be_within(1).of(140.38)
          expect(position.altitude).to be_within(1).of(44.77)
        end
      end

      context "summer_solstice" do
        let(:time) { summer_solstice }

        it "calculates the azimuth and altitude" do
          expect(position.azimuth).to be_within(1).of(115.76)
          expect(position.altitude).to be_within(1).of(64.12)
        end
      end

      context "fall_equinox" do
        let(:time) { fall_equinox }

        it "calculates the azimuth and altitude" do
          expect(position.azimuth).to be_within(1).of(145.13)
          expect(position.altitude).to be_within(1).of(46.92)
        end
      end

      context "winter_solstice" do
        let(:time) { winter_solstice }

        it "calculates the azimuth and altitude" do
          expect(position.azimuth).to be_within(1).of(155.22)
          expect(position.altitude).to be_within(1).of(24.85)
        end
      end
    end

    context "north_pole" do
      let(:city) { north_pole }

      context "spring equinox" do
        let(:time) { spring_equinox }

        it "calculates the azimuth and altitude" do
          expect(position.azimuth).to be_within(1).of(95.51)
          expect(position.altitude).to be_within(1).of(0.26)
        end
      end

      context "summer_solstice" do
        let(:time) { summer_solstice }

        it "calculates the azimuth and altitude" do
          expect(position.azimuth).to be_within(1).of(97.02)
          expect(position.altitude).to be_within(1).of(23.48)
        end
      end

      context "fall_equinox" do
        let(:time) { fall_equinox }

        it "calculates the azimuth and altitude" do
          expect(position.azimuth).to be_within(1).of(99.44)
          expect(position.altitude).to be_within(1).of(0.52)
        end
      end

      context "winter_solstice" do
        let(:time) { winter_solstice }

        it "calculates the azimuth and altitude" do
          expect(position.azimuth).to be_within(1).of(97.98)
          expect(position.altitude).to be_within(1).of((-23.41))
        end
      end
    end
  end
end

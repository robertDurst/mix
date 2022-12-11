require './lib/machine/number'
require './lib/machine/byte'

describe Number do
  context "single byte" do
    it "works with 0" do
      expected = [0, 0, 0, 0, 0, 0, 0, 0]
      actual = Number.new(0, bytes: 1).bytes[0].content

      expect(actual).to match_array(expected)
    end

    it "works with 1" do
      expected = [0, 0, 0, 0, 0, 0, 0, 1]
      actual = Number.new(1, bytes: 1).bytes[0].content

      expect(actual).to match_array(expected)
    end

    it "works with 2" do
      expected = [0, 0, 0, 0, 0, 0, 1, 0]
      actual = Number.new(2, bytes: 1).bytes[0].content

      expect(actual).to match_array(expected)
    end

    it "works with 3" do
      expected = [0, 0, 0, 0, 0, 0, 1, 1]
      actual = Number.new(3, bytes: 1).bytes[0].content

      expect(actual).to match_array(expected)
    end

    it "works with 64" do
      expected = [1, 0, 0, 0, 0, 0, 0, 0]
      actual = Number.new(64, bytes: 1).bytes[0].content

      expect(actual).to match_array(expected)
    end

    it "works with 255" do
      expected = [1, 1, 1, 1, 1, 1, 1, 1]
      actual = Number.new(255, bytes: 1).bytes[0].content

      pp actual

      expect(actual).to match_array(expected)
    end
  end

  context "double byte" do
    it "works with 0" do
      expected = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
      actual = Number.new(0, bytes: 2).bytes.map { |x| x.content }.flatten

      expect(actual).to match_array(expected)
    end

    it "works with 255" do
      expected = [0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1]
      actual = Number.new(255, bytes: 2).bytes.map { |x| x.content }.flatten

      pp actual

      expect(actual).to match_array(expected)
    end

    it "works with 256" do
      expected = [0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]
      actual = Number.new(256, bytes: 2).bytes.map { |x| x.content }.flatten

      pp actual

      expect(actual).to match_array(expected)
    end

    it "works with 65535" do
      expected = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
      actual = Number.new(65535, bytes: 2).bytes.map { |x| x.content }.flatten

      expect(actual).to match_array(expected)
    end
  end

  context "four bytes" do
    it "works with 4294967295" do
      actual = Number.new(4294967295, bytes: 4).bytes

      expect(actual.size).to eq(4)
      expect(actual[1].content).to match_array([1, 1, 1, 1, 1, 1, 1, 1])
    end
  end

  context "ten bytes" do
    it "works with 1208925819614629174706175" do
      actual = Number.new(1208925819614629174706175, bytes: 10).bytes

      expect(actual.size).to eq(10)
      expect(actual[9].content).to match_array([1, 1, 1, 1, 1, 1, 1, 1])
    end
  end
end

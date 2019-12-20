require 'station'

describe Station do

  describe '#initialize' do
    subject { Station.new('Bank', 1)}

    it 'gets the station' do
      expect(subject.station).to eq 'Bank'
    end

    it 'gets the zone' do
      expect(subject.zone).to eq 1
    end
  end

end
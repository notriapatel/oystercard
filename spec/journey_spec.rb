require 'journey'

describe Journey do
  describe '#initialize' do
    it 'initializes start station with nil' do
      expect(subject.starts).to eq nil
    end

    it 'initializes end station with nil' do
      expect(subject.ends).to eq nil
    end
  end

  describe '#touch_in' do
    it 'starts a journey' do

    end
  end
end
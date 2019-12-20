require 'journey'

describe Journey do
  describe '#initialize' do
    it 'initializes start station with nil' do
      expect(subject.start).to eq nil
    end

    it 'initializes end station with nil' do
      expect(subject.ends).to eq nil
    end
  end
end
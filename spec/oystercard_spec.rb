require 'oystercard'

describe Oystercard do 
  
  let(:entry_station) {double :entry_station}
  let(:exit_station) {double :exit_station}
  let(:journey) {{start: entry_station, end: exit_station}}

  describe '#initialization' do 
    it 'has a balance of zero' do
    expect(subject.balance).to eq 0
    end 
    it 'expects an empty array as default'do 
      expect(subject.journey_history).to eq []
    end 
  end 

  describe '#top_up' do 
    it {is_expected.to respond_to(:top_up).with(1).argument }
   
    it 'can top up balance' do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end

    it "raises an error if the max balance is exceeded" do
      max_balance = Oystercard::MAX_BALANCE
      subject.top_up(max_balance)
      expect { subject.top_up 1 }.to raise_error "Balance cannot exceed £#{max_balance}"
    end
  end 

  describe '#touch_in' do 
    it 'raises error if balance < min fare' do 
      expect{subject.touch_in(entry_station)}.to raise_error "Not enough money on Oystercard" 
    end 

    it 'stores entry_station' do 
      subject.top_up(Oystercard::MIN_FARE)
      subject.touch_in(entry_station)
      expect(subject.entry_station).to eq entry_station
    end 
  end 

  describe '#touch_out' do 
    it 'deducts min_balance from @balance' do 
      subject.top_up(Oystercard::MIN_FARE)
      expect{subject.touch_out(:exit_station)}.to change{subject.balance}.by(-Oystercard::MIN_FARE)
    end 
    
    # put the above in a context?
    before(:each) do
      subject.top_up(Oystercard::MIN_FARE)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
    end

    it 'forgets station on touch_out' do 
      expect(subject.entry_station).to eq nil
    end  

    it 'checks for a full hash in array' do 
      expect(subject.journey_history).to eq [journey]
      # expect(subject.journey_history).to include journey
      # same shit ^^^
    end
  end 

  describe '#in_journey?' do
    it 'should default be false' do
      expect(subject.in_journey?).to be false
      end 

    it 'should be true after touching in' do
      subject.top_up(Oystercard::MIN_FARE)
      subject.touch_in(entry_station)
      expect(subject.in_journey?).to be true
    end 
  end 
end 
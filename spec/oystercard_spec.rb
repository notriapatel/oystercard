require 'oystercard'

describe Oystercard do
  
  describe '#initialize' do
    it "has a balance of zero" do
        expect(subject.balance).to eq(0)
    end
  end

  describe '#top_up' do

    it 'can top up balance' do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end

    it "raises an error if the max balance is exceeded" do
      max_balance = Oystercard::MAX_BALANCE
      subject.top_up(max_balance)
      expect { subject.top_up 1 }.to raise_error "Balance cannot exceed £#{max_balance}"
    end
  end

  describe "#deduct" do
    it "deducts from balance" do
      subject.top_up(1)
      subject.deduct(1)
      expect(subject.balance).to eq 0
    end
  end

  # describe "#in_journey" do
  #   it "checks if oyster card is currently in journey" do
  #     expect(subject.in_journey?).to eq false
  #   end
  # end

  # describe "#touch_in" do
  #   it "touches in" do
  #     expect(subject.touch_in).to eq true
  #   end
  # end

  # describe "#touch_out" do
  #   it "touches out" do
  #     expect(subject.touch_out).to eq false
  #   end
  # end
end

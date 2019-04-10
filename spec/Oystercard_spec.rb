require 'oystercard'

describe Oystercard do
  it { is_expected.to respond_to(:balance) }

  describe '#balance' do
  it "expects a default balance" do
    expect(subject.balance).to eq 0
  end
end

  describe '#top_up' do
    it "increases the balance value" do
      expect { subject.top_up(10) }.to change { subject.balance }.by 10
    end
    it "raise error if balance exceeds 90" do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up(maximum_balance)
      expect { subject.top_up(1) }.to raise_error "£#{maximum_balance}, maximum exceeded"
    end
  end

  # describe '#deduct' do
  #   it 'deducts amount from balance' do
  #     subject.top_up(10)
  #     expect { subject.deduct(10) }.to change { subject.balance }.by -10
  #   end
  # end

  describe '#in_journey' do
    context do 'when touched in'
      station = " "
      before do
        expect{ subject.touch_in(station) }.to raise_error 'insufficient funds'
      end
      it 'returns true' do
        subject.top_up(10)
        subject.touch_in(station)
        expect(subject.in_journey).to eq true
      end
      it 'remembers entry station' do
        subject.top_up(10)
        expect(subject.touch_in(station)).to eq station
      end
    end
    context do 'when touched out'
      it 'forgets entry station' do
        expect(subject.touch_out).to eq nil
        expect { subject.touch_out }.to change { subject.balance }.by(-Oystercard::MINIMUM_BALANCE)
      end
      it 'returns false' do
        expect(subject.in_journey).to eq false
      end
    end
  end
end

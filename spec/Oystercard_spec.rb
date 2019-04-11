require 'oystercard'

describe Oystercard do

  let(:station) { double :station }

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

  describe '#touch_in' do
    context 'when touched in' do
      before do
        expect{ subject.touch_in(station) }.to raise_error 'insufficient funds'
      end
      it 'expects #in_journey to return true' do
        subject.top_up(10)
        subject.touch_in(station)
        expect(subject.in_journey).to eq true
      end
      it 'remembers entry station' do
        subject.top_up(10)
        expect(subject.touch_in(station)).to eq({Entry: station})
      end
    end


  describe '#touch_out' do
    context 'when touched out' do
      it 'records exit station' do
        subject.top_up(10)
        subject.touch_in(station)
        expect(subject.touch_out(station)).to eq([{Entry: station, Exit: station}])
      end
    end
    it 'returns false' do
      expect(subject.in_journey).to eq false
    end
    it 'deducts the minimum charge' do
      expect { subject.touch_out(station) }.to change { subject.balance }.by(-Oystercard::MINIMUM_CHARGE)
    end
  end
  end
end

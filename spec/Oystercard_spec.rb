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
end

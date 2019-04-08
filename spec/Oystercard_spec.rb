require 'oystercard'

describe Oystercard do
  it { is_expected.to respond_to(:balance) }

  it "expects a default balance" do
    expect(subject.balance).to eq 0
  end
end

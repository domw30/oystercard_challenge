require 'oystercard'

describe Oystercard do
  it "responds to #balance" do
    expect(subject).to respond_to(:balance)
  end
  it "expects a default balance" do
    expect(subject.balance).to eq 0
  end
end

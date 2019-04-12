require 'journey'

describe Journey do

  let(:station) { double :station }


    it { is_expected.to respond_to(:start_journey).with(1).argument }

    describe '#start_journey' do
      it 'records the entry station for a journey' do
        subject.start_journey(station)
        expect(subject.entry_station).to eq station
      end
    end

    it { is_expected.to respond_to(:end_journey).with(1).argument }

    describe '#end_journey' do
      it 'records the exit station for a journey' do
        subject.end_journey(station)
        expect(subject.exit_station).to eq station
      end
    end

    describe '#journey_complete' do
      it 'should return an incomplete journey if no entry station' do
        subject.end_journey("Farringdon")
        expect(subject.journey_complete?).to eq false
      end
      it 'should return an incomplete journey if no exit station' do
        subject.start_journey("Old Street")
        expect(subject.journey_complete?).to eq false
      end
    end

    describe '#fare' do
      it 'should return the minimum fare for a complete journey' do
        allow(subject).to receive(:journey_complete?).and_return true
        expect(subject.fare).to eq Journey::MINIMUM_FARE
      end

      it 'should return a penalty fare for an incomplete journey' do
        allow(subject).to receive(:journey_complete?).and_return false
        expect(subject.fare).to eq Journey::PENALTY_FARE
      end
    end
end

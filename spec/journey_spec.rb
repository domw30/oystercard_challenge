require 'journey'

describe Journey do
    it { is_expected.to respond_to(:start_journey).with(1).argument }

    describe '#start_journey' do
      it 'records the entry station for a journey' do
        expect(subject.start_journey("Old Street")).to eq( {entry: "Old Street"} )
      end
    end

    it { is_expected.to respond_to(:end_journey).with(1).argument }

    describe '#end_journey' do
      it 'records the exit station for a journey' do
        subject.start_journey("Old Street")
        expect(subject.end_journey("Farringdon")).to eq( {entry: "Old Street", exit: "Farringdon"} )
      end
    end

    describe '#journey_complete' do
      it 'should return an incomplete journey if no entry station' do

      end
      it 'should return an incomplete journey if no exit station' do

      end
    end

    describe '#fare' do
      it 'should return the minimum fare for a complete journey' do

      end

      it 'should return a penalty fare for an incomplete journey' do

      end
    end
end

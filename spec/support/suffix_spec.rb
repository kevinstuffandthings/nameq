module NameQ
  module Support
    describe Suffix do
      let(:index) { 'q8' }
      let(:subject) { described_class.new(index) }

      describe '#to_s' do
        it 'works out fine with the default template' do
          expect(subject.to_s).to eq ' (q8)'
        end

        context 'overridden template' do
          let(:subject) { described_class.new(index, template: '-[%{index}]-') }

          it 'works out fine with the overridden template' do
            expect(subject.to_s).to eq '-[q8]-'
          end
        end
      end
    end
  end
end

module NameQ
  module Support
    describe Suffix do
      let(:index) { '88' }
      let(:subject) { described_class.new(index) }
      let(:custom_template) { '-[%{index}]-' }

      describe '#strip' do
        let(:text) { 'How about this' }

        it 'can ignore templateless content' do
          expect(subject.strip(text)).to eq text
        end

        it 'can strip the content of its template' do
          expect(subject.strip("#{text} (7)")).to eq text
        end

        it 'is not tripped up by template-like content' do
          expect(subject.strip("#{text} (7)!")).to eq "#{text} (7)!"
        end

        context 'overridden template' do
          let(:subject) { described_class.new(index, template: custom_template) }

          it 'can strip the content of its template' do
            expect(subject.strip("#{text}-[7]-")).to eq text
          end

          it 'is not tripped up by template-like content' do
            expect(subject.strip("#{text}-[7]-!")).to eq "#{text}-[7]-!"
          end

          it 'is not tripped up by default template-like content' do
            expect(subject.strip("#{text} (7)")).to eq "#{text} (7)"
          end
        end
      end

      describe '#to_s' do
        it 'works out fine with the default template' do
          expect(subject.to_s).to eq ' (88)'
        end

        context 'overridden template' do
          let(:subject) { described_class.new(index, template: custom_template) }

          it 'works out fine with the overridden template' do
            expect(subject.to_s).to eq '-[88]-'
          end
        end
      end
    end
  end
end

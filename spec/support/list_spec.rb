module NameQ
  module Support
    describe List do
      let(:array) { %w[One Two Three] }
      let(:subject) { described_class.new(array.clone) }

      context 'internals' do
        describe '#all' do
          let(:refiller) { %w[Four Five] }
          let(:all) { subject.send(:all) }

          context 'array only' do
            it 'knows all its stuff' do
              expect(all).to match_array array
            end
          end

          context 'refiller only' do
            let(:subject) { described_class.new { refiller } }

            it 'knows all its stuff' do
              expect(all).to match_array refiller
            end
          end

          context 'all options' do
            let(:subject) { described_class.new(array) { refiller } }

            it 'knows all its stuff' do
              expect(all).to match_array(array + refiller)
            end
          end
        end
      end

      describe '#include?' do
        context 'default (case-sensitive)' do
          it 'can miss' do
            expect(subject.include?('Eight')).to be false
          end

          it 'can miss due to case' do
            expect(subject.include?('two')).to be false
          end

          it 'can match' do
            expect(subject.include?('Two')).to be true
          end
        end

        context 'case-insensitive' do
          let(:subject) { described_class.new(array, case_sensitive: false) }

          it 'can miss' do
            expect(subject.include?('Eight')).to be false
          end

          it 'can match outside case' do
            expect(subject.include?('three')).to be true
          end

          it 'can match' do
            expect(subject.include?('Three')).to be true
          end
        end
      end

      describe '#add' do
        let(:value) { 'Eight' }

        it 'adds items when you ask it to' do
          expect(subject.send(:all)).to match_array array
          expect(subject.add(value)).to eq value
          expect(subject.send(:all)).to match_array(array + [value])
        end
      end
    end
  end
end

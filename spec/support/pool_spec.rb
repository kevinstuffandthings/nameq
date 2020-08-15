module NameQ
  module Support
    describe Pool do
      context 'internals' do
        let(:subject) { described_class.new(nil) }

        describe '#suffixes' do
          let(:suffixes) { subject.send(:suffixes) }

          it 'can get a suffix' do
            result = suffixes.first
            expect(result).to be_a NameQ::Support::Suffix
            expect(result.index).to eq 1
          end

          it 'can get 10 suffixes and you have to just trust that it can get even more' do
            count = 0
            suffixes.each_with_index do |suffix, i|
              expect(suffix).to be_a NameQ::Support::Suffix
              expect(suffix.index).to eq i + 1
              break if (count += 1) >= 10
            end
            expect(count).to eq 10
          end
        end

        describe '#entry_factory' do
          it 'has a default entry factory' do
            expect(subject.send(:entry_factory)).to eq NameQ::Support::StringEntry
          end
        end
      end

      xdescribe '#take' do
        it 'can take a name when available' do
        end

        it 'can fall back a few when needed' do
        end
      end
    end
  end
end

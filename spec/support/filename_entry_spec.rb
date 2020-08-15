module NameQ
  module Support
    describe FilenameEntry do
      let(:text) { 'Some Filename' }
      let(:subject) { described_class.new(text) }

      describe '#resolve' do
        let(:suffix) { instance_double(NameQ::Support::Suffix, to_s: '-yup') }

        context 'without extension' do
          it 'resolves itself without a suffix' do
            expect(subject.resolve).to eq text
          end

          it 'resolves itself with a suffix' do
            expect(subject.resolve(suffix)).to eq "#{text}#{suffix}"
          end
        end

        context 'with extension' do
          let(:extension) { '.meh' }
          let(:subject) { described_class.new("#{text}#{extension}") }

          it 'resolves itself without a suffix' do
            expect(subject.resolve).to eq "#{text}#{extension}"
          end

          it 'resolves itself with a suffix' do
            expect(subject.resolve(suffix)).to eq "#{text}#{suffix}#{extension}"
          end
        end
      end
    end
  end
end

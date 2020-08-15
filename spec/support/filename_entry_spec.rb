module NameQ
  module Support
    describe FilenameEntry do
      let(:text) { 'Some Filename' }
      let(:subject) { described_class.new(text) }

      describe '#resolve' do
        let(:suffix) { instance_double(NameQ::Support::Suffix, to_s: '-yup') }
        let(:stripped_text) { "#{text} stripped" }
        before(:each) { allow(suffix).to receive(:strip).with(text).and_return stripped_text }

        context 'without extension' do
          it 'resolves itself without a suffix' do
            expect(subject.resolve).to eq text
          end

          it 'resolves itself with a suffix' do
            expect(subject.resolve(suffix)).to eq "#{stripped_text}#{suffix}"
          end
        end

        context 'with extension' do
          let(:extension) { '.meh' }
          let(:subject) { described_class.new("#{text}#{extension}") }

          it 'resolves itself without a suffix' do
            expect(subject.resolve).to eq "#{text}#{extension}"
          end

          it 'resolves itself with a suffix' do
            expect(subject.resolve(suffix)).to eq "#{stripped_text}#{suffix}#{extension}"
          end
        end
      end
    end
  end
end

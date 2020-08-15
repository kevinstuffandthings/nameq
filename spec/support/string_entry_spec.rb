module NameQ
  module Support
    describe StringEntry do
      let(:text) { 'This is something' }
      let(:subject) { described_class.new(text) }

      describe '#resolve' do
        let(:suffix) { instance_double(NameQ::Support::Suffix, to_s: '!') }

        it 'resolves itself without a suffix' do
          expect(subject.resolve).to eq text
        end

        it 'resolves itself with a suffix' do
          expect(subject.resolve(suffix)).to eq "#{text}!"
        end
      end
    end
  end
end

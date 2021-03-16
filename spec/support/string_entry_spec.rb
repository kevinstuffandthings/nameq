module NameQ
  module Support
    describe StringEntry do
      let(:text) { "This is something" }
      let(:subject) { described_class.new(text) }

      describe "#resolve" do
        let(:suffix) { instance_double(NameQ::Support::Suffix, to_s: "!") }
        let(:stripped_text) { "#{text} stripped" }
        before(:each) { allow(suffix).to receive(:strip).with(text).and_return stripped_text }

        it "resolves itself without a suffix" do
          expect(subject.resolve).to eq text
        end

        it "resolves itself with a suffix" do
          expect(subject.resolve(suffix)).to eq "#{stripped_text}!"
        end
      end
    end
  end
end

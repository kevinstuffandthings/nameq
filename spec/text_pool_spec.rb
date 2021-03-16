module NameQ
  describe TextPool do
    let(:items) { %w[all of these names] }
    let(:subject) { described_class.new(items) }

    it "is a kind of pool" do
      expect(subject).to be_a NameQ::Support::Pool
    end

    context "internals" do
      context "underlying list" do
        let(:list) { instance_double(NameQ::Support::List) }
        let(:result) { subject.instance_variable_get("@list") }

        it "builds the right kind of list by default" do
          expect(NameQ::Support::List).to receive(:new).with(items, case_sensitive: true).and_return list
          expect(result).to eq list
        end

        context "case-insensitive" do
          let(:subject) { described_class.new(items, case_sensitive: false) }

          it "builds the right kind of list by default" do
            expect(NameQ::Support::List).to receive(:new).with(items, case_sensitive: false).and_return list
            expect(result).to eq list
          end
        end
      end

      describe "#entry_factory" do
        it "has a regular string entry factory" do
          expect(subject.send(:entry_factory)).to eq NameQ::Support::StringEntry
        end
      end
    end
  end
end

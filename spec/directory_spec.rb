module NameQ
  describe Directory do
    let(:path) { "/path/to/somewhere" }
    let(:subject) { described_class.new(path) }

    it "is a kind of pool" do
      expect(subject).to be_a NameQ::Support::Pool
    end

    context "internals" do
      context "underlying list" do
        let(:list) { instance_double(NameQ::Support::List) }
        let(:result) { subject.instance_variable_get("@list") }

        it "builds the right kind of list by default" do
          expect(NameQ::Support::List).to receive(:new).with(case_sensitive: true).and_return list
          expect(result).to eq list
        end

        context "case-insensitive" do
          let(:subject) { described_class.new(path, case_sensitive: false) }

          it "builds the right kind of list by default" do
            expect(NameQ::Support::List).to receive(:new).with(case_sensitive: false).and_return list
            expect(result).to eq list
          end
        end

        context "refresh" do
          let(:path) { File.expand_path(".") }
          let(:items) { result.send(:all) }

          it "has a block that does the right stuff" do
            expect(items).to include("nameq.gemspec", "Gemfile", "Rakefile")
          end
        end
      end

      describe "#entry_factory" do
        it "has a special filename entry factory" do
          expect(subject.send(:entry_factory)).to eq NameQ::Support::FilenameEntry
        end
      end
    end
  end
end

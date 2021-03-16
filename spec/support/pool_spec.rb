module NameQ
  module Support
    describe Pool do
      let(:list) { instance_double(NameQ::Support::List) }
      let(:subject) { described_class.new(list) }

      context "internals" do
        describe "#suffixes" do
          let(:suffixes) { subject.send(:suffixes) }

          it "can get a suffix" do
            result = suffixes.first
            expect(result).to be_a NameQ::Support::Suffix
            expect(result.index).to eq 1
          end

          it "can get 10 suffixes and you have to just trust that it can get even more" do
            count = 0
            suffixes.each_with_index do |suffix, i|
              expect(suffix).to be_a NameQ::Support::Suffix
              expect(suffix.index).to eq i + 1
              break if (count += 1) >= 10
            end
            expect(count).to eq 10
          end
        end

        describe "#entry_factory" do
          it "has a default entry factory" do
            expect(subject.send(:entry_factory)).to eq NameQ::Support::StringEntry
          end
        end

        describe "#resolve" do
          let(:resolution) { double }
          let(:entry) { instance_double(NameQ::Support::StringEntry, resolve: resolution) }
          let(:suffixes) { 3.times.map { |i| instance_double(NameQ::Support::Suffix, index: (i + 1) * 8) } }
          before(:each) do
            allow(subject).to receive(:suffixes).and_return suffixes
            allow(list).to receive(:include?).and_return true
            allow(list).to receive(:include?).with(resolution).and_return false
          end

          it "can hit on the first try" do
            expect(subject.send(:resolve, entry)).to eq resolution
          end

          it "can hit... eventually..." do
            [0, 1].each { |i| allow(entry).to receive(:resolve).with(suffixes[i]).and_return double }
            expect(subject.send(:resolve, entry)).to eq resolution
          end
        end
      end

      describe "#take" do
        let(:name) { double }

        it "can take a name when available" do
          allow(list).to receive(:include?).with(name).and_return false
          expect(list).to receive(:add).with(name).and_return name
          expect(subject.take(name)).to eq name
        end

        context "fallback" do
          let(:entry) { double }
          let(:resolved_name) { double }
          before(:each) { allow(subject.send(:entry_factory)).to receive(:new).with(name).and_return entry }

          it "can fall back a few when needed" do
            allow(list).to receive(:include?).with(name).and_return true
            expect(subject).to receive(:resolve).with(entry).and_return resolved_name
            expect(list).to receive(:add).with(resolved_name)
            expect(subject.take(name)).to eq resolved_name
          end
        end
      end
    end
  end
end

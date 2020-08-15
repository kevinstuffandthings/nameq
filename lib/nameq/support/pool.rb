# frozen_string_literal: true
module NameQ
  module Support
    class Pool
      def take(name)
        return list.add(name) unless list.include?(name)
        entry = entry_factory.new(name)
        suffixes.each do |suffix|
          resolution = entry.resolve(suffix)
          return list.add(resolution) unless list.include?(resolution)
        end
      end

      protected

      attr_reader :list

      def initialize(list)
        @list = list
      end

      def entry_factory
        Support::StringEntry
      end

      private

      def suffixes
        (1 .. Float::INFINITY).lazy.map { |i| Suffix.new(i) }
      end
    end
  end
end

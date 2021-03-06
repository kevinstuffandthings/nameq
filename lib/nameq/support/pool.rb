# frozen_string_literal: true

module NameQ
  module Support
    class Pool
      # Take a name from the available pool of names,
      # suffixed if necessary.
      # @param name [String] the name to find a variant of within the pool
      # @return [String] the resolved name from the pool
      def take(name)
        return list.add(name) unless list.include?(name)
        resolve(entry_factory.new(name)).tap { |n| list.add(n) }
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

      def resolve(entry)
        suffixes.each do |suffix|
          resolution = entry.resolve(suffix)
          return resolution unless list.include?(resolution)
        end
      end

      def suffixes
        (1..Float::INFINITY).lazy.map { |i| Suffix.new(i) }
      end
    end
  end
end

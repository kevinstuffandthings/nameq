# frozen_string_literal: true

module NameQ
  module Support
    class List
      def initialize(items = nil, case_sensitive: true, &refill)
        @items = items || []
        @comparator = case_sensitive ? :eql? : :casecmp?
        @refill = refill
      end

      def add(name)
        @items << name
        name
      end

      def include?(name)
        all.any? { |a| a.send(@comparator, name) }
      end

      private

      def all
        @items + (@refill&.call || [])
      end
    end
  end
end

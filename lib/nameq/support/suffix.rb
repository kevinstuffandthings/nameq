# frozen_string_literal: true
module NameQ
  module Support
    class Suffix
      attr_reader :index

      def initialize(index, template: nil)
        @index = index
        @template = template || ' (%{index})'
      end

      def to_s
        @template % {index: index}
      end
    end
  end
end

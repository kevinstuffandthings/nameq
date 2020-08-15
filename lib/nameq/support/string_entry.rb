# frozen_string_literal: true
module NameQ
  module Support
    class StringEntry
      def initialize(text)
        @text = text
      end

      def resolve(suffix = nil)
        return @text if suffix.nil?
        "#{@text}#{suffix}"
      end
    end
  end
end

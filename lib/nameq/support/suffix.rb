# frozen_string_literal: true

module NameQ
  module Support
    class Suffix
      TOKEN = "%{index}"
      attr_reader :index

      def initialize(index, template: nil)
        @index = index
        @template = template || " (#{TOKEN})"
      end

      def strip(text)
        text.sub(regex, "")
      end

      def to_s
        @template % {index: index}
      end

      private

      def regex
        @_regex ||= begin
          first, last = @template.split(TOKEN)
          Regexp.new(Regexp.quote(first) + "[0-9]+" + Regexp.quote(last) + "$")
        end
      end
    end
  end
end

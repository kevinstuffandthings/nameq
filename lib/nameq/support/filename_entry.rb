# frozen_string_literal: true
require_relative './string_entry'

module NameQ
  module Support
    class FilenameEntry < StringEntry
      def resolve(suffix = nil)
        return @text if suffix.nil?
        extension = File.extname(@text)
        "#{@text.chomp(extension)}#{suffix}#{extension}"
      end
    end
  end
end

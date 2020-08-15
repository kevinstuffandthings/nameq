# frozen_string_literal: true
require_relative './string_entry'

module NameQ
  module Support
    class FilenameEntry < StringEntry
      def resolve(suffix = nil)
        return @text if suffix.nil?
        extension = File.extname(@text)
        basename = suffix.strip(@text.chomp(extension))
        "#{basename}#{suffix}#{extension}"
      end
    end
  end
end

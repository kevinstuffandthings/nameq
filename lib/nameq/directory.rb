# frozen_string_literal: true
module NameQ
  class Directory < Support::Pool
    # Set up a new directory-based pool.
    # @param name [String] the location on disk of the directory
    # @param case_sensitive [Boolean] should uniqueness of names consider case-sensitivity?
    # @return [Directory]
    def initialize(name, case_sensitive: true)
      list = Support::List.new(case_sensitive: case_sensitive) do
        Dir[File.join(name, '*')].map { |f| File.basename(f) }
      end
      super list
    end

    protected

    def entry_factory
      Support::FilenameEntry
    end
  end
end

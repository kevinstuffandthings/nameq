# frozen_string_literal: true

module NameQ
  class TextPool < Support::Pool
    # Set up a new text-based pool.
    # @param name [Array<String>] the list of items to be included in the initial pool
    # @param case_sensitive [Boolean] should uniqueness of names consider case-sensitivity?
    # @return [TextPool]
    def initialize(items, case_sensitive: true)
      super(Support::List.new(items, case_sensitive: case_sensitive))
    end
  end
end

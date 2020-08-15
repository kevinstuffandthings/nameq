# frozen_string_literal: true
module NameQ
  class TextPool < Support::Pool
    def initialize(items, case_sensitive: true)
      super(Support::List.new(items, case_sensitive: case_sensitive))
    end
  end
end

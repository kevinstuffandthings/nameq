# frozen_string_literal: true
require "nameq/version"

%w[string_entry filename_entry suffix list pool].each { |f| require "nameq/support/#{f}" }
%w[text_pool directory].each { |f| require "nameq/#{f}" }


# NameQ
module NameQ
end

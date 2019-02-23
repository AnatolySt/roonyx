require 'active_support/json/encoding'

module ActiveSupport
  module JSON
    module Encoding
      class JSONGemEncoder
        def stringify jsonified
          ::JSON.pretty_generate jsonified, quirks_mode: true, max_nesting: false
        end
      end
    end
  end
end if Rails.env.development? && Gem::Dependency.new('rails', '~> 5.2.2').match?('rails', Rails.version)

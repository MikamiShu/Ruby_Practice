# frozen_string_literal: true

require 'capybara/rspec/matchers/base'

module Capybara
  module RSpecMatchers
    module Matchers
      class HaveTitle < WrappedElementMatcher
        def element_matches?(el)
          el.assert_name(*@args, **@kw_args)
        end

        def element_does_not_match?(el)
          el.assert_no_name(*@args, **@kw_args)
        end

        def description
          "have name #{name.inspect}"
        end

      private

        def name
          @args.first
        end
      end
    end
  end
end

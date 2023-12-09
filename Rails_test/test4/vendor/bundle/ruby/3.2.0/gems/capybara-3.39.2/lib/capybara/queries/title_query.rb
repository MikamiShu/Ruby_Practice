# frozen_string_literal: true

module Capybara
  # @api private
  module Queries
    class TitleQuery < BaseQuery
      def initialize(expected_name, **options)
        @expected_name = expected_name.is_a?(Regexp) ? expected_name : expected_name.to_s
        @options = options
        super(@options)
        @search_regexp = Helpers.to_regexp(@expected_name, all_whitespace: true, exact: options.fetch(:exact, false))
        assert_valid_keys
      end

      def resolves_for?(node)
        (@actual_name = node.name).match?(@search_regexp)
      end

      def failure_message
        failure_message_helper
      end

      def negative_failure_message
        failure_message_helper(' not')
      end

    private

      def failure_message_helper(negated = '')
        verb = @expected_name.is_a?(Regexp) ? 'match' : 'include'
        "expected #{@actual_name.inspect}#{negated} to #{verb} #{@expected_name.inspect}"
      end

      def valid_keys
        %i[wait exact]
      end
    end
  end
end

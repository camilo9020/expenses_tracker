ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'minitest/reporters'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new


class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, browser: :chrome)
  end

  class ActionDispatch::IntegrationTest
    include Capybara::DSL
    include Devise::Test::IntegrationHelpers
    # Add support for JavaScript in our tests. We can now write:
    #
    #    test "does something", js: true do
    #       assert true
    #    end
    #
    # Notice the 'js: true' option.
    class << self
      def test(name, options={}, &block)
        super name do
          if options[:js]
            Capybara.current_driver = Capybara.javascript_driver
          end
          self.instance_eval &block
          if options[:js]
            Capybara.use_default_driver
          end
        end
      end
    end
  end

  # Add more helper methods to be used by all tests here...
end

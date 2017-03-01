ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  

  test "most mentions default test" do
    destination File.expand_path("../tmp", File.dirname(__FILE__))
    setup :prepare_destination
    assert true
  end  
end

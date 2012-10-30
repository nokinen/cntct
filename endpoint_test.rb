# encoding: UTF-8
require "./endpoint"
require "test/unit"
require "rack/test"

set :environment, :test

class EndpointTest < Test::Unit::TestCase
  include Rack::Test::Methods
  
  def app
    Sinatra::Application
  end
  
  def test_it_returns_200_with_correct_params
    post "/submit", name: "Tobias Fünke", email: "tobias@bloothfamily.com", phone: "t.fünke", time: "Afternoon"
    assert last_response.status == 200
  end

  def test_it_returns_400_with_incorrect_params
    post "/submit"
    assert last_response.status == 400
  end
  
end
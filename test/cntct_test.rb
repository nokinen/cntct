# encoding: UTF-8
require "./cntct"
require "test/unit"
require "rack/test"

set :environment, :test

class CntctTest < Test::Unit::TestCase
  include Rack::Test::Methods
  
  def app
    Sinatra::Application
  end
  
  def test_it_returns_200_with_correct_params
    post "/submit", name: "Tobias Fünke", email: "tobias@bloothfamily.com", phone: "t.fünke", time: "Afternoon"
    assert last_response.status == 200
  end

  def test_it_returns_400_with_missing_params
    post "/submit"
    assert last_response.status == 400
    post "/submit", email: "tobias@bloothfamily.com", phone: "t.fünke", time: "Afternoon"
    assert last_response.status == 400
    post "/submit", name: "Tobias Fünke", phone: "t.fünke", time: "Afternoon"
    assert last_response.status == 400
    post "/submit", name: "Tobias Fünke", email: "tobias@bloothfamily.com", time: "Afternoon"
    assert last_response.status == 400
    post "/submit", name: "Tobias Fünke", email: "tobias@bloothfamily.com", phone: "t.fünke"
    assert last_response.status == 400
  end

  def test_it_returns_400_with_empty_params
    post "/submit", name: "", email: "", phone: "", time: ""
    assert last_response.status == 400
    post "/submit", name: "Tobias Fünke", email: "", phone: "t.fünke", time: "Afternoon"
    assert last_response.status == 400
    post "/submit", name: "Tobias Fünke", email: "tobias@bloothfamily.com", phone: "", time: "Afternoon"
    assert last_response.status == 400
    post "/submit", name: "Tobias Fünke", email: "tobias@bloothfamily.com", phone: "t.fünke", time: ""
    assert last_response.status == 400
    post "/submit", name: "", email: "tobias@bloothfamily.com", phone: "t.fünke", time: "Afternoon"
    assert last_response.status == 400
  end
  
end
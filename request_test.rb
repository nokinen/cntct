# encoding: UTF-8
require "./request"
require "test/unit"
require "rack/test"

set :environment, :test

class RequestTest < Test::Unit::TestCase
  include Rack::Test::Methods
  
  def app
    Sinatra::Application
  end
  
  def test_it_returns_303_with_correct_params
    post "/request", name: "Tobias Fünke", email: "tobias@bloothfamily.com", phone: "t.fünke", time: "Afternoon"
    assert last_response.status == 303
  end

  def test_it_returns_400_with_missing_params
    post "/request"
    assert last_response.status == 400
    post "/request", email: "tobias@bloothfamily.com", phone: "t.fünke", time: "Afternoon"
    assert last_response.status == 400
    post "/request", name: "Tobias Fünke", phone: "t.fünke", time: "Afternoon"
    assert last_response.status == 400
    post "/request", name: "Tobias Fünke", email: "tobias@bloothfamily.com", time: "Afternoon"
    assert last_response.status == 400
    post "/request", name: "Tobias Fünke", email: "tobias@bloothfamily.com", phone: "t.fünke"
    assert last_response.status == 400
  end

  def test_it_returns_400_with_empty_params
    post "/request", name: "", email: "", phone: "", time: ""
    assert last_response.status == 400
    post "/request", name: "Tobias Fünke", email: "", phone: "t.fünke", time: "Afternoon"
    assert last_response.status == 400
    post "/request", name: "Tobias Fünke", email: "tobias@bloothfamily.com", phone: "", time: "Afternoon"
    assert last_response.status == 400
    post "/request", name: "Tobias Fünke", email: "tobias@bloothfamily.com", phone: "t.fünke", time: ""
    assert last_response.status == 400
    post "/request", name: "", email: "tobias@bloothfamily.com", phone: "t.fünke", time: "Afternoon"
    assert last_response.status == 400
  end
  
end
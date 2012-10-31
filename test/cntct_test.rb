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
  
  def test_req_it_returns_200_with_correct_params
    post "/request", name: "Tobias Fünke", email: "tobias@bloothfamily.com", phone: "t.fünke", time: "Afternoon"
    assert last_response.status == 200
  end

  def test_req_it_returns_400_with_missing_params
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

  def test_req_it_returns_400_with_empty_params
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
  
  def test_msg_it_returns_400_with_missing_params
    post "/message"
    assert last_response.status == 400
    post "/message", email: "foo@bar.com", body: "Lorem"
    assert last_response.status == 400
    post "/message", subject: "Foo Bar", email: "foo@bar.com"
    assert last_response.status == 400
    post "/message", subject: "Foo Bar", body: "Lorem"
    assert last_response.status == 400
  end
  
  def test_msg_it_returns_400_with_empty_params
    post "/message", subject: "", email: "", body: ""
    assert last_response.status == 400
    post "/message", subject: "", email: "foo@bar.com", body: "Lorem"
    assert last_response.status == 400
    post "/message", subject: "Foo Bar", email: "foo@bar.com", body: ""
    assert last_response.status == 400
    post "/message", subject: "Foo Bar", email: "", body: "Lorem"
    assert last_response.status == 400
  end

  def test_msg_it_returns_200_with_correct_params
    post "/message", subject: "Foo Bar", email: "foo@bar.com", body: "Lorem"
    assert last_response.status == 200
  end
  
end
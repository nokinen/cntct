require 'sinatra'
require 'json'
require 'pony'

get "/request" do
  erb :request
end

get "/confirm" do
  "Thanks for your request!"
end

post '/request' do
    name = params[:name]
    email = params[:email]
    phone = params[:phone]
    time = params[:time]
    
    unless name.blank? or email.blank? or phone.blank? or time.blank? then
      Pony.mail to: ENV['EMAIL_RECIPIENT'], from: email, subject: 'Phone Interview Request', 
        body: "Please call me (#{phone}) in the #{time}." unless test?
        redirect "/confirm", 303
    else
      return 400
    end
end
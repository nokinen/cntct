require 'sinatra'
require 'json'
require 'pony'

get "/" do
  erb :request
end

post '/submit' do
    name = params[:name]
    email = params[:email]
    phone = params[:phone]
    time = params[:time]
    
    unless name.blank? or email.blank? or phone.blank? or time.blank? then
      msg = "Please call me at (#{phone}) in the #{time}."
      Pony.mail from: email, subject: "Request", body: msg unless test?
    else
      return 400
    end
end
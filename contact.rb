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
      Pony.mail to: ENV['EMAIL_RECIPIENT'], from: email, subject: 'Phone Interview Request', 
        body: "Please call me (#{phone}) in the #{time}." unless test?
    else
      return 400
    end
end
require 'sinatra'
require 'json'
require 'pony'

post '/submit' do
    
    name = params[:name]
    email = params[:email]
    phone = params[:phone]
    time = params[:time]
    
    if name and email and phone and time then
      Pony.mail to: ENV['EMAIL_RECIPIENT'], from: email, subject: 'Phone Interview Request', 
        body: "Please call me (#{phone}) in the #{time}." unless test?
    else
      return 400
    end
end
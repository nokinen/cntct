require 'sinatra'
require 'json'
require 'pony'

get "/" do
  erb :cntct
end

post '/request' do
  name = params[:name]
  email = params[:email]
  phone = params[:phone]
  time = params[:time]
    
  if name.blank? or email.blank? or phone.blank? or time.blank? then
    return 400
  else
    msg = "Please call me at (#{phone}) in the #{time}."
    Pony.mail from: email, subject: "Request", body: msg unless test?
  end
end

post '/message' do
  email = params[:email]
  subject = params[:subject]
  body = params[:body]
  
  if email.blank? or subject.blank? or body.blank? then
    return 400
  else
    Pony.mail from: email, subject: subject, body: body unless test?
  end
end
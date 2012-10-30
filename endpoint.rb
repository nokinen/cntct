require 'sinatra'
require 'json'
require 'pony'

get '/' do
  "The endpoint for the form webhook from unbounce can be reached via: <pre>POST /submit</pre>"
end

post '/submit' do
    if params["data.json"] then
      data = JSON.parse params["data.json"]
      name = data["name"] && data["name"].first
      email = data["email_adress"] && data["email_adress"].first
      phone = data["phone_number_or_skype_contact"] && data["phone_number_or_skype_contact"].first
      time = data["best_timt_to_call"] && data["best_timt_to_call"].first
    end
    
    if name and email and phone and time then
      Pony.mail to: 'tobias@noig.es', from: email, subject: 'Phone Interview Request', 
        body: "Please call me (#{phone}) in the #{time}."
    else
      return 400
    end
end
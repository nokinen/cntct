require 'sinatra'

get '/' do
  "This is the endpoint for a form webhook from unbounce that can be reached via: <pre>POST /submit</pre>"
end

post '/submit' do
  logger.info "Params: #{params}"
end
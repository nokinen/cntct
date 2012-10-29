require 'sinatra'

post '/submit' do
  logger.info "Params: #{params}"
end
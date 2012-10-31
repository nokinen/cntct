require './cntct'

configure :development do
  Pony.options = {
    to: ENV['EMAIL_RECIPIENT']
  }
end

configure :production do 
  Pony.options = {
    to: ENV['EMAIL_RECIPIENT'],
    via: :smtp,
    via_options: {
      address: 'smtp.sendgrid.net',
      port: '587',
      domain: 'heroku.com',
      user_name: ENV['SENDGRID_USERNAME'],
      password: ENV['SENDGRID_PASSWORD'],
      authentication: :plain,
      enable_starttls_auto: true
    }
  }
end

run Sinatra::Application
# Configuration
## Add EMAIL_RECIPIENT to ENV
### On Heroku
	heroku config:add EMAIL_RECIPIENT=foo@bar.com
### Locally
1. Create a ```Procfile```:
	
		touch Procfile
		echo "web: bundle exec rackup config.ru -p $PORT" > Procfile

2. Create ```.env```:
	
		touch .env
		echo "EMAIL_RECIPIENT=foo@bar.com" > .env
		
3. Run locally with foreman:

		foreman start
# Configuration
## Setup recipient email address
### On Heroku
	heroku config:add EMAIL_RECIPIENT=foo@bar.com
### On your local machine
1. Create file ```.env``` and add variables:
	
		touch .env
		echo "EMAIL_RECIPIENT=foo@bar.com" > .env
		
2. Run with foreman:

		foreman start
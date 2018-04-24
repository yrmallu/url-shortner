# URL Shortener.

This project makes your URL to more useful, short URLs. It is easy to use. Just enter your URL and get shortener URL.

## Installation

* Fork/Clone this repo to your machine
* cd to this project folder
* In your terminal run rake db:create then rakedb:migrate
* Run 'rails s' in your terminal

## Technologies

* PostgreSQL as a database
* Bootstrap as a frontend
* Azure as a PaaS

## Thought Process

* A unique alphanumeric code of generated for each shortened link, this means that we can get more unique combinations
* The link records a count of how many times it has been "Clicked"
* The link can be associated with a user, this allows for stats of the link usage for a particular user
* The link can be a public or private, this allows to restrict the links to publish as per needs

## Future improvements

* Simple authentication was implemented currently we can use Devise, Oauth etc..
* For role management we can use cancancan




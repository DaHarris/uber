# uber foodtruck challenge

Demo: http://foodtruckin.herokuapp.com

This coding challenge was submitted to Uber for consideration in my application
for a developer position. The basis for the challenge was to provide an API for
food trucks in San Francisco. Original data for the API was provided by
the San Francisco local government APIs @ https://data.sfgov.org/Economy-and-Community/Mobile-Food-Facility-Permit/rqzj-sfat? .

The solution was originally focused on the back-end. However, due to my full stack
knowledge I decided to make a sample front-end side to demo what could be
done with the API.

# tech

Although Uber uses mostly python for the back-end, I decided to do the challenge
with Ruby on Rails and Javascript/Jquery for the front-end. Showcasing the full
depth of my knowledge comfortably and quickly was my main goal for this challenge.
Given the opportunity to have time with python I'm sure I could produce similar results.

The back-end originally parsed the csv (left the code in the parse_file model) from the API but I moved to using json due to the larger prevalence in production code. API calls to
populate the database from DATASF only happen once a day (more on that later). The lat and long locations given by the DATASF api were miserably off so I used the Google Geocoding API
to get new lat and long locations for each food truck.

Viewing the sample API usage (front-end) requires no login, but to use the API you must be registered and signed in as a user. New users are provided with an API key to use in API
calls. Users are only allowed 1000 calls per day to the API. Users not providing a key
or exceeding their rate limit are given json errors.

Two rake tasks are automated by Wheneverizer and run at midnight. The first calls the
DATASF api to see if any food trucks have been added (I told you we would get back to this) and the second resets all user api_requests counter to 0.

Front-end and back-end were completely written by me. Custom CSS was provided with
a css reset and custom columns. Other technologies used were the twitter API for embedded
tweets from the San Francisco food truck Twitter, Faraday for HTTP Requests, Google Maps API,
wheneverize for scheduling rake tasks, and some other gems in the Gemfile.

# what else

There is always more I could get done. I could provide multiple API keys to users depending
on how many projects they had. I would provide ratings for food trucks. I would spend more time making the pullout look better. I would eat at each one of the food trucks (for research purposes).

# me! (Daniel Harris)

If I've managed to keep your attention this long, I'd love if you checked out some of my
other work on my portfolio website. Thanks!

http://daharris.ninja

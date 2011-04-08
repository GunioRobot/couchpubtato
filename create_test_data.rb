# seeds a CouchDB with some test feeds. run via: ruby create_test_data.rb

# change to your couch. admin username and password require if you're not in admin party
# e.g. YOURCOUCH = "admin:password@localhost:5984"
YOURCOUCH = "localhost:5984"

feeds = ["http://www.nytimes.com/services/xml/rss/nyt/africa.xml","http://www.nytimes.com/services/xml/rss/nyt/americas.xml","http://www.nytimes.com/services/xml/rss/nyt/artanddesign.xml","http://www.nytimes.com/services/xml/rss/nyt/arts.xml","http://www.nytimes.com/services/xml/rss/nyt/asiapacific.xml","http://www.nytimes.com/services/xml/rss/nyt/automobiles.xml","http://www.nytimes.com/services/xml/rss/nyt/baseball.xml","http://www.nytimes.com/services/xml/rss/nyt/books.xml","http://www.nytimes.com/services/xml/rss/nyt/business.xml","http://www.nytimes.com/services/xml/rss/nyt/collegebasketball.xml","http://www.nytimes.com/services/xml/rss/nyt/collegefootball.xml","http://www.nytimes.com/services/xml/rss/nyt/diningandwine.xml","http://www.nytimes.com/services/xml/rss/nyt/education.xml","http://www.nytimes.com/services/xml/rss/nyt/environment.xml","http://www.nytimes.com/services/xml/rss/nyt/europe.xml","http://www.nytimes.com/services/xml/rss/nyt/fashionandstyle.xml","http://www.nytimes.com/services/xml/rss/nyt/globalbusiness.xml","http://www.nytimes.com/services/xml/rss/nyt/globalhome.xml","http://www.nytimes.com/services/xml/rss/nyt/golf.xml","http://www.nytimes.com/services/xml/rss/nyt/health.xml","http://www.nytimes.com/services/xml/rss/nyt/healthcarepolicy.xml","http://www.nytimes.com/services/xml/rss/nyt/hockey.xml","http://www.nytimes.com/services/xml/rss/nyt/homeandgarden.xml","http://www.nytimes.com/services/xml/rss/nyt/homepage.xml","http://www.nytimes.com/services/xml/rss/nyt/magazine.xml","http://www.nytimes.com/services/xml/rss/nyt/mediaandadvertising.xml","http://www.nytimes.com/services/xml/rss/nyt/middleeast.xml","http://www.nytimes.com/services/xml/rss/nyt/movies.xml","http://www.nytimes.com/services/xml/rss/nyt/music.xml","http://www.nytimes.com/services/xml/rss/nyt/nutrition.xml","http://www.nytimes.com/services/xml/rss/nyt/nyregion.xml","http://www.nytimes.com/services/xml/rss/nyt/obituaries.xml","http://www.nytimes.com/services/xml/rss/nyt/opinion.xml","http://www.nytimes.com/services/xml/rss/nyt/pop_top.xml","http://www.nytimes.com/services/xml/rss/nyt/probasketball.xml","http://www.nytimes.com/services/xml/rss/nyt/profootball.xml","http://www.nytimes.com/services/xml/rss/nyt/realestate.xml","http://www.nytimes.com/services/xml/rss/nyt/science.xml","http://www.nytimes.com/services/xml/rss/nyt/soccer.xml","http://www.nytimes.com/services/xml/rss/nyt/space.xml","http://www.nytimes.com/services/xml/rss/nyt/sports.xml","http://www.nytimes.com/services/xml/rss/nyt/sundaybookreview.xml","http://www.nytimes.com/services/xml/rss/nyt/technology.xml","http://www.nytimes.com/services/xml/rss/nyt/television.xml","http://www.nytimes.com/services/xml/rss/nyt/theater.xml","http://www.nytimes.com/services/xml/rss/nyt/travel.xml","http://www.nytimes.com/services/xml/rss/nyt/weddings.xml","http://www.nytimes.com/services/xml/rss/nyt/weekinreview.xml","http://www.nytimes.com/services/xml/rss/nyt/world.xml","http://www.nytimes.com/services/xml/rss/nyt/yourmoney.xml"];

# create the necessary storage databases
puts %x!curl -X PUT http://#{YOURCOUCH}/feeds -H "Content-type":"application/json"!
puts %x!curl -X PUT http://#{YOURCOUCH}/articles -H "Content-type":"application/json"!

# make a feed entry in couch for each feed
feeds.each {|feed| puts %x!curl -X POST http://#{YOURCOUCH}/feeds -d '{"feed": "#{feed}", "db": "articles"}' -H "Content-type":"application/json"!}
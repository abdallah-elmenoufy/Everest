# Everest
5th "The Capstone" Project of my Udacity iOS Developer Nanodegree

Everest is iOS app that allows a user to explore the world through both flickr and foursquare services, where user drops a pin on the initial view map, instantly allows a two background APIs calls to each of; flickr API to get the associated photos with the dropped pin's coordinates using its latitude and longitude as parameters, and to foursquare API to search/explore the near venues to this pin using its coordinates as well.

Flickr photos and Foursquare venues are displayed in Collection View/Table View controllers.

Photos and Venues are saved into Core Data using one-to-many relationship, and fetched upon app is launched back.

Future work:

Integrate OAuth to both APIs where users can take photos of theirselves and post it to flickr, and be able to like/rate/comment, and checkin at certain venues using their foursquare accounts as well.

Integrate Uber API to allow user to get ride from where he/she dropped the PIN towards the selected venue on the map.

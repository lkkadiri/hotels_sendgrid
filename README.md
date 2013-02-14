# Hotel Reservation System


An Application to make Hotel reservations.

## Installation:

* Clone the Repo:
```ruby
git@github.com:lkkadiri/hotels_sendgrid.git
```

* Create The Database
```ruby
rake db:create
```

* Migrate the Database and populate all the tables
```ruby
rake db:migrate
```
* Run the application
```ruby
rails s
```

## Application features:

User can create as many Hotels as needed.

User can create as many rooms belonging to each of the Hotels as needed.

Once a user has rooms that belong to a Hotel, they can start making reservations on individual rooms. The system sends an email to the user once they make a reservation confirming the Hotel name and the Room name.

A User cannot book a room when it is occupied.

The user can also cancel reservations and an email is sent to notify the user of the cancellations.
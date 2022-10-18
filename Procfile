server: rails s -p 3000 -b 0.0.0.0
mqtt_subscriber: wait-for-it.sh -t 0 localhost:3000 -- ruby ./mqtt/subscribers/mqtt_subscriber.rb
#!/usr/bin/ruby

# Create a ~/.twitter/credentials.yml file.
# Example:
# name: twittername
# password: password

require 'rubygems'
require 'rest_client'

path = File.join(File.join(ENV['HOME'], ".twitter"), "credentials.yml")
user = YAML::load_file(path)

RestClient.log = "stdout"

resource  = RestClient::Resource.new("http://twitter.com/statuses/update.xml",
                                     :user     => user['name'],
                                     :password => user['password'])

resource.post :status => ARGV[0]
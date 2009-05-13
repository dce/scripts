#!/usr/local/bin/ruby

require 'rubygems'
require 'net/http'
require 'json'

def web_link(url)
  text = url.length > 30 ? url[0, 30] + "&hellip;" : url
  "<a href=\"#{url}\">#{text}</a>"
end

def twitter_link(word)
  name = word[/\w+/]
  word.gsub(name, "<a href=\"http://twitter.com/#{name}\">#{name}</a>")
end

uri = URI.parse("http://twitter.com/statuses/user_timeline/#{ARGV[0]}.json")
data = JSON.parse(Net::HTTP.get(uri)).first
id = data["id"]
user = data["user"]["screen_name"]

tweet = data["text"].split(' ').map do |word|
  case word
  when /^@/
    twitter_link(word)
  when /^http/
    web_link(word)
  else
    word
  end
end * ' '

print "#{tweet} <a href=\"http://www.twitter.com/#{user}/statuses/#{id}\">&#8734;</a>"
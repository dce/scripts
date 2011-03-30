#!/usr/local/bin/ruby

$KCODE = "UTF8"

require 'rubygems'
require 'net/http'
require 'json'
require 'twitter-text'

include Twitter::Extractor
include Twitter::Autolink
include Twitter::HitHighlighter

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
tweet = auto_link(data["text"]) 

print "#{tweet} <a href=\"http://www.twitter.com/#{user}/statuses/#{id}\">&#8734;</a>"

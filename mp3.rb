#!/usr/bin/ruby

# Download all MP3 files linked from a given URL

require "open-uri"

url   = ARGV.first
data  = open(url)

data.read.scan(/href="(.*mp3)"/).each do |filename|
  `curl -O #{url}#{filename.first}`
end
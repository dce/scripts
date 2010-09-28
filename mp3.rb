#!/usr/bin/ruby

# Download all MP3 files linked from a given URL

require "open-uri"

root  = ARGV.first
data  = open(root)

data.read.scan(/href="(.*mp3)"/).each do |filename|
  url = filename.first
  url = "#{root}#{url}" unless url =~ /^http/
  p url
  `curl -O "#{url}"`
end
#!/usr/bin/ruby

require 'rubygems'
require 'json'

# If you say "peekaboo" to him, he replies back "thppp".

# If you @reply him three times, he adds you as a friend.

# Then when you say "peekaboo", he says "peekaboo".

data = JSON.parse(File.open("tad.json").read)

raise data .inspect
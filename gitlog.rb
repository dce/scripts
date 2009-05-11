#!/usr/bin/ruby

require 'rubygems'
require 'activesupport'
require 'git'

AUTHORS = ['deisinger', 'David Eisinger']

Git.open('.').log(300).select { |commit|
  AUTHORS.include?(commit.author.name) and commit.message.strip.match(/^(Merge|git-svn)/).nil?
}.group_by {|commit| commit.date.to_date }.sort.reverse.each do |date, commits|
  puts "-- #{date.strftime('%A, %D')} --\n\n#{commits.map(&:message) * "\n"}\n\n"
end


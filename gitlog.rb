#!/usr/bin/ruby

require 'rubygems'
require 'activesupport'
require 'git'

AUTHORS = ['deisinger', 'David Eisinger']

commits = Git.open('.').log(300).select do |commit|
  AUTHORS.include?(commit.author.name)
end

commits.group_by {|commit| commit.date.to_date }.sort.reverse.each do |date, commits|
  puts "\n  #{date.strftime('%A, %D')}\n\n"

  commits.each do |commit|
    commit.message.split("\n").each do |line|
      puts line unless line.blank? or line.strip =~ /^(Merge|git-svn)/
    end
  end
end


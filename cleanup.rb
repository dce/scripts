dirs = `ls -1 ~/Projects`.split(/\n/)

dirs.each do |dir|
  puts "Cleaning #{dir}..."
  system "cd ~/Projects/#{dir}; rake log:clear; git gc"
end


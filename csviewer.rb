#!/usr/bin/env ruby

#
# CSViewer - csviewer.rb
#
# A simple command line csv files viewer.
#
# Receives as parameters the filename and delimiter
#
# Usage: csviewer.rb users.csv ';'
#
# Where users.csv is the file to be read and ; is delimiter
# Default delimiter is space.
#
# Angelito M. Goulart
# angelitomg.com
#
# September/2012
#
#

# Variables declaration
filename = ARGV[0].to_s
delimiter = ARGV[1].to_s

# If filename is empty, show script usage
if filename.empty? then
	puts "Usage: csviewer.rb filename delimiter"
	puts "Example: csviewer.rb users.csv ';'"
	exit 1
end

# Check delimiter
if delimiter.empty? or !delimiter =~ /[-;.|*+,_\/\#\@\$\%\&]/ then
	delimiter = " "
end

# Verify file
if File.exists?(filename) then
	
	# Open file
	file = File.open(filename)
	
	puts "\n\nFile: " + filename + "\n\n"
	
	# Read each line
	file.each do |line|
	
		line.split(delimiter).each do |field|
			puts field
		end
		
		puts "--------------------------------------------------------------------------------"
				
	end
	
else
	puts "Invalid file"
	exit 1
end

# Additional file data
puts "\nFile size: " + file.size.to_s + " bytes"
puts "Last modified: " + file.mtime.to_s

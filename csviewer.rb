#!/usr/bin/env ruby

#
# Log View - logview.rb
#
# A simple csv files viewer. Receives a file as parameter, read each line of the file 
# and displays each field in a row
#
# Receives as parameters the filename and delimiter fields
#
# Usage: csviewer.rb users.csv ;
#
# Where users.csv is the file to be read and ; is the delimiter
# of the fields in the file. Default delimiter is space.
#
# Angelito M. Goulart
# github.com/angelitomg
#
# September/2012
#
#

# Variables declaration
filename = ARGV[0].to_s
delimiter = ARGV[1].to_s

# If filename is empty, show usage of the script
if filename.empty? then
	puts "Usage: csviewer.rb filename delimiter"
	puts "Delimiter is the fields delimiter in the csv file (optional)"
	puts "Example: csviewer.rb users.csv ;"
	exit 1
end

# Verify if delimiter is invalid
if delimiter.empty? or !delimiter =~ /[-;.|*+,_\/\#\@\$\%\&]/ then
	delimiter = " "
end

# Verify file
if File.exists?(filename) then
	
	# Open file
	file = File.open(filename)
	
	# Print filename
	puts "\n\nFile: " + filename + "\n\n"
	
	# Read each line of the file
	file.each do |line|
	
		# Get the value of fields
		fields = line.split(delimiter)
		
		# Print each field
		fields.each do |field|
			puts field
		end
		
		# Separator
		puts "--------------------------------------------------------------------------------"
				
	end
	
else
	puts "Invalid file"
	exit 1
end

# Additional data of the file
puts "\nFile size: " + file.size.to_s + " bytes"
puts "Last modified: " + file.mtime.to_s
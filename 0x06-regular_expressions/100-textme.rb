#!/usr/bin/env ruby

# This script extracts the sender, receiver, and flags from a given log line.
log_entry = ARGV[0]

# Use regular expressions to capture sender, receiver, and flags
sender = log_entry[/\[from:(.*?)\]/, 1]
receiver = log_entry[/\[to:(.*?)\]/, 1]
flags = log_entry[/\[flags:(.*?)\]/, 1]

# Output the extracted values in the required format
puts "#{sender},#{receiver},#{flags}"

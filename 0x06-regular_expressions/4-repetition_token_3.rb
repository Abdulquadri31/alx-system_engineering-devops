#!/usr/bin/env ruby

# Accepts one argument from the command line
input = ARGV[0]

# Checks if the input matches the pattern and prints the match if it does
puts input if input.match?(/^h.n$/)

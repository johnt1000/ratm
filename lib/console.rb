#!/usr/bin/env ruby
require 'readline'
require_relative 'ratm'

trap('INT', 'SIG_IGN') # X -> Ctrl+C

$ctx = 'main' # console context
@ratm = Ratm.new

require_relative 'boot'

boot = Boot.new
boot.update_gems

# commands
CMDS = [
    'zipbruteforce'.yellow.concat("\tBrute force for zip files."),
    'ls'.yellow.concat("\t\tList files."),
    'help'.yellow.concat("\t\tList all commands."),
    'version'.yellow.concat("\t\tSystem version."),
    'exit'.yellow.concat("\t\tExit or quit."),
].sort

completion = 
    proc do |str|
        case
        when Readline.line_buffer =~ /zipbruteforce.*/i
            params = Readline.line_buffer.split(/ /)
            puts `ruby vendor/zipbruteforce/zipbruteforce #{params[1]} #{params[2]}`
        when Readline.line_buffer =~ /help.*/i
            puts "\nAvailable commands:\n".blue + "#{CMDS.join("\n")}"
        when Readline.line_buffer =~ /rubyfu.*/i
            puts "Rubyfu, where Ruby goes evil!"
        when Readline.line_buffer =~ /ls.*/i
            puts `ls`
        when Readline.line_buffer =~ /version.*/i
            puts @ratm.version
        when Readline.line_buffer =~ /exit.*/i
            puts 'Exiting..'
            puts `clear`
            exit 0
        else
            CMDS.grep( /^#{Regexp.escape(str)}/i ) unless str.nil?
        end
    end

Readline.completion_proc = completion
Readline.completion_append_character = ' '

while line = Readline.readline("ratm(#{$ctx})> ", true)
    puts completion.call
    break if line =~ /^quit.*/i or line =~ /^exit.*/i
end
require_relative "./classes/ticket.rb"
require_relative "./methods/methods.rb"

if ARGV.length > 0
    username = ARGV[0]
    ARGV.clear
else
    puts "What is your username?"
    username = gets.chomp
end
puts "Welcome #{username} to Event Tickets."
sleep(1.5)

# begin
#     num 10/0
# rescue ZeroDivisionError
#     puts "Division by zero error"
# end

main
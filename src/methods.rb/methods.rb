require "tty-prompt"
require "colorize"
require "artii"

def main
	system("clear")
	prompt = TTY::Prompt.new
	list_of_tickets = []
	loop do 
		 system("clear")
		a = Artii::Base.new  :font => 'slant'
		puts a.asciify('EVENT TICKETS').colorize(:red)
		puts "Welcome to Event Tickets"
		puts ""
    puts "Main Menu"
		selection = prompt.select("\nYour options are") do |menu|
			menu.choice "Buy a Ticket"
			menu.choice "Adjust Tickets"
			menu.choice "Exit"
		end
		if selection == "Buy a Ticket"
			new_ticket = create_ticket()
			puts new_ticket.to_s
			puts "Enter any key to continue"
			gets
			list_of_tickets.push new_ticket
		elsif selection == "Adjust Tickets"
			list_of_tickets = ticket_adjust(list_of_tickets)
		else
			exit
		end
	end
end

def create_ticket
	system("clear")
	a = Artii::Base.new  :font => 'slant'
	puts a.asciify('NEW TICKET').colorize(:red)
	prompt = TTY::Prompt.new
	puts "Please enter your name."
	puts ""
  	puts "Name: (E.g 'John Smith')".colorize(:green)
	name = gets.chomp
	event = prompt.select("Choose your event:") do |menu|
		menu.choice 'Trance'
		menu.choice 'Rock'
		menu.choice 'Country'
		menu.choice 'Hip Hop'
	end
	location = prompt.select("Choose a Location:") do |menu|
		menu.choice 'Front'
		menu.choice 'Middle'
		menu.choice 'Back'
		menu.choice 'Anywhere'
	end
	vip = prompt.select("Are you a VIP?") do |menu|
		menu.choice 'Yes'
		menu.choice 'No'
		menu.choice 'If available'
  end
	  return Ticket.new(name, event, location, vip)
end
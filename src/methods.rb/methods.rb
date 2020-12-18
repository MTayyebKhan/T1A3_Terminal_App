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

def ticket_adjust(tickets)
	system("clear")
	a = Artii::Base.new  :font => 'slant'
	puts a.asciify('EVENT TICKETS').colorize(:red)
	prompt = TTY::Prompt.new
	puts "\nWhat would you like to do?"
	selection = prompt.select("\nChoose an option:") do |menu|
		menu.choice 'Edit ticket', 1
		menu.choice 'Cancellation', 2
		menu.choice 'Menu', 3
    end
	if selection == 1
		ticket_edit(tickets)
	elsif selection == 2
		ticket_delete(tickets)
	end
	return tickets
end

def ticket_delete(tickets)
    system("clear")
    a = Artii::Base.new  :font => 'slant'
	puts a.asciify('CANCELLATION').colorize(:red)
    prompt = TTY::Prompt.new
    if tickets.empty? == false
        delete_selection = prompt.select("Which ticket would you like to cancel:") do |menu|
            tickets.each do |ticket|
                menu.choice (tickets.index(ticket) + 1)
            end
        end
    else
        puts "No tickets purchased. Press 'Enter' to  return to menu."
        gets
        return
    end
    tickets.delete_at(delete_selection.to_i - 1)
end

def ticket_edit(tickets)
    system("clear")
    a = Artii::Base.new  :font => 'slant'
	puts a.asciify('EDIT').colorize(:red)
	prompt = TTY::Prompt.new
    if tickets.empty? == false
        edit_selection = prompt.select("Select a ticket to adjust:") do |menu|
            menu.choice (tickets.index(ticket) +1)
        end
    end
else
    puts "No tickets purchased. Press 'Enter' to return to menu."
    gets
    return
end
ticket_attribute_selection = prompt.select("What would you like to adjust?") do |menu|
    menu.choice "Name", 1
    menu.choice "Event", 2
    menu.choice "Location", 3
    menu.choice "VIP", 4
    menu.choice "Cancel", 5
end
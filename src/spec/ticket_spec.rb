require_relative '../classes/ticket.rb'

# Rspec Test
describe Ticket do
    it "to_s method should return a String" do
        ticket = Ticket.new("test_name", "test_event", "test_location", "test_status")
        expect(ticket.to_s).to be_a(String)
    end
    it "Setters should over-ride the inital values" do
        ticket = Ticket.new("initial_name", "test_event", "test_location", "test_status")
        expect(ticket.name).to eq("initial_name")
        ticket.name = "new_name"
        expect(ticket.name).to eq("new_name")
    end
end
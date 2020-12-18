require_relative '../classes/ticket.rb'

describe Ticket do
    it "to_s method should return a String" do
        ticket = Ticket.new("test_name", "test_event", "test_location", "test_status")
        expect(ticket.to_s).to be_a(String)
    end
end
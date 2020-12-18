#Class Ticket with attr
class Ticket
    attr_reader :name, :event, :location, :vip
    attr_writer :name, :event, :location, :vip
    def initialize(name, event, location, vip)
      @name = name
      @event = event
      @location = location
      @vip = vip
    end
    def to_s
      receipt = ""
      receipt << "************************\n"
      receipt << "Name:  ---------- #{@name}\n\n"
      receipt << "Event: ---------- #{@event}\n\n"
      receipt << "Location: ------- #{@location}\n\n"
      receipt << "VIP: ------------ #{@vip}\n"
      receipt << "************************"
      return receipt
    end
end
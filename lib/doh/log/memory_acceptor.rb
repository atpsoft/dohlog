module DohLog

class MemoryAcceptor
  attr_accessor :events

  def initialize
    @events = []
  end

  def add(event)
    @events << event
  end

  def shutdown
    @events.clear
  end
end

end

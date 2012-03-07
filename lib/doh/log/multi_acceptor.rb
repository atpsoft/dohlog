module DohLog

class MultiAcceptor
  def initialize(*acceptors)
    @acceptors = acceptors
  end

  def add(event)
    @acceptors.each { |obj| obj.add(event) }
  end

  def shutdown
    @acceptors.each { |obj| obj.shutdown }
  end
end

end

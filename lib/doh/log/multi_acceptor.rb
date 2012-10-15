module DohLog

class MultiAcceptor
  attr_reader :acceptors

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

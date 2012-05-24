module DohLog

class FilterAcceptor
  def initialize(acceptor, &pred)
    @acceptor = acceptor
    @pred = pred
  end

  def add(event)
    if @pred.call(event)
      @acceptor.add(event)
    end
  end

  def shutdown
    @acceptor.shutdown
  end
end

end

module DohLog

class FilterAcceptor
  def initialize(acceptor, else_acceptor = nil, &pred)
    @acceptor = acceptor
    @else_acceptor = else_acceptor
    @pred = pred
  end

  def add(event)
    if @pred.call(event)
      @acceptor.add(event)
    elsif @else_acceptor
      @else_acceptor.add(event)
    end
  end

  def shutdown
    @acceptor.shutdown
  end
end

end

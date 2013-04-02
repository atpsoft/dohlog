module DohLog

class AppendAcceptor
  def initialize(acceptor, &pred)
    @acceptor = acceptor
    @pred = pred
  end

  def add(event)
    extras_to_add = @pred.call(event)
    if extras_to_add
      event.extras.merge!(extras_to_add)
    end
    @acceptor.add(event)
  end

  def shutdown
    @acceptor.shutdown
  end
end

end

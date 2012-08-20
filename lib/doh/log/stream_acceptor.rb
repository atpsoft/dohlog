module DohLog

class StreamAcceptor
  attr_reader :ios

  def initialize(flush, ios = nil)
    @ios = ios || STDOUT
    @ios.sync = flush
  end

  def add(event)
    @ios.puts("#{event.summary}\n#{event.exception_text}")
  end

  def shutdown
    @ios.close
    @ios = nil
  end
end

end

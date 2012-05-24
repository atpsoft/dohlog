module DohLog

class StreamAcceptor
  attr_reader :ios

  def initialize(flush, ios = nil)
    @flush = flush
    @ios = ios || STDOUT
  end

  def add(event)
    @ios.puts("#{event.summary}\n#{event.exception_text}")
    @ios.fsync if @flush
  end

  def shutdown
    @ios.fsync
    @ios = nil
  end
end

end

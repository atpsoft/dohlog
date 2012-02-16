module DohLog

class StreamAcceptor
  attr_reader :ios

  def initialize(flush, ios = nil)
    @flush = flush
    @ios = ios || STDOUT
  end

  def add(event)
    @ios.puts(event.summary)
    if event.severity >= DohLog::ERROR
      @ios.puts("=> exception: #{event.exception_text}")
      @ios.puts("=> stack:")
      event.call_stack.each { |elem| @ios.puts("=> #{elem}") }
    end
    @ios.fsync if @flush
  end

  def shutdown
    @ios.fsync
    @ios = nil
  end
end

end

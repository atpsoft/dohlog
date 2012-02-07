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
      @ios.puts("=> exception: #{event.exception_name}")
      @ios.puts("=> stack: #{event.call_stack}")
    end
    @ios.fsync if @flush
  end

  def shutdown
    @ios.fsync
    @ios = nil
  end
end

end
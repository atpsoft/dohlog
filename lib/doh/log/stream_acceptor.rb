module DohLog

class StreamAcceptor
  attr_reader :ios

  def initialize(ios)
    @ios = ios
  end

  def add(event)
    @ios.puts("#{event.summary}\n#{event.exception_text}")
  end

  def shutdown
    @ios = nil
  end
end

end

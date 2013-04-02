require 'dohlog/event'

module DohLog

class Interface
  @@acceptor = nil

  def self.setup(acceptor)
    @@acceptor = acceptor
  end

  def self.shutdown
    @@acceptor.shutdown
  end

  def initialize(location)
    @location = location
  end

  def debug(msg, exception = nil)
    @@acceptor.add(Event.new(DohLog::DEBUG, msg, @location, exception))
  end

  def info(msg, exception = nil)
    @@acceptor.add(Event.new(DohLog::INFO, msg, @location, exception))
  end

  def notify(msg, exception = nil)
    @@acceptor.add(Event.new(DohLog::NOTIFY, msg, @location, exception))
  end

  def warn(msg, exception = nil)
    @@acceptor.add(Event.new(DohLog::WARN, msg, @location, exception))
  end

  def error(msg, exception = nil)
    @@acceptor.add(Event.new(DohLog::ERROR, msg, @location, exception))
  end

  def fatal(msg, exception = nil)
    @@acceptor.add(Event.new(DohLog::FATAL, msg, @location, exception))
  end
end

end

require 'doh/log/event'

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

  def debug(msg)
    @@acceptor.add(Event.new(DohLog::DEBUG, msg, @location))
  end

  def info(msg)
    @@acceptor.add(Event.new(DohLog::INFO, msg, @location))
  end

  def warn(msg)
    @@acceptor.add(Event.new(DohLog::WARN, msg, @location))
  end

  def error(msg, exception = nil)
    @@acceptor.add(Event.new(DohLog::ERROR, msg, @location, exception))
  end

  def fatal(msg, exception = nil)
    @@acceptor.add(Event.new(DohLog::FATAL, msg, @location, exception))
  end
end

def self.setup(acceptor)
  DohLog::Interface.setup(acceptor)
end

def self.shutdown
  DohLog::Interface.shutdown
end

end

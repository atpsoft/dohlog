require 'dohlog/event'

module DohLog

class Interface
  @@acceptor = nil
  @@enabled = false

  def self.setup(acceptor)
    @@acceptor = acceptor
    @@enabled = true
  end

  def self.shutdown
    @@acceptor.shutdown
  end

  def self.enable
    @@enabled = true
  end

  def self.disable
    @@enabled = false
  end

  def initialize(location)
    @location = location
  end

  def debug(msg, exception = nil)
    if @@enabled
      @@acceptor.add(Event.new(DohLog::DEBUG, msg, @location, exception))
    end
  end

  def info(msg, exception = nil)
    if @@enabled
      @@acceptor.add(Event.new(DohLog::INFO, msg, @location, exception))
    end
  end

  def notify(msg, exception = nil)
    if @@enabled
      @@acceptor.add(Event.new(DohLog::NOTIFY, msg, @location, exception))
    end
  end

  def warn(msg, exception = nil)
    if @@enabled
      @@acceptor.add(Event.new(DohLog::WARN, msg, @location, exception))
    end
  end

  def error(msg, exception = nil)
    if @@enabled
      @@acceptor.add(Event.new(DohLog::ERROR, msg, @location, exception))
    end
  end

  def fatal(msg, exception = nil)
    if @@enabled
      @@acceptor.add(Event.new(DohLog::FATAL, msg, @location, exception))
    end
  end
end

end

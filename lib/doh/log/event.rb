require 'doh/log/severity'

module DohLog

class Event
  attr_accessor :severity, :msg, :location, :exception, :time

  def initialize(severity, msg, location = '', exception = nil)
    @severity, @msg, @location, @exception = severity, msg, location, exception
    @time = Time.now
  end

  def severity_text
    DohLog::severity_text(@severity)
  end

  def time_text
    @time.strftime("%H:%M:%S.") << "%03d" % (@time.usec / 1000)
  end

  def datetime_text
    @time.strftime("%Y-%m-%d %H:%M:%S.") << "%03d" % (@time.usec / 1000)
  end

  def exception_text
    if @exception then "#{@exception.class} => #{@exception.message}" else '' end
  end

  def call_stack
    if @exception then @exception.backtrace else caller end
  end

  def summary
    "#{datetime_text} [#{severity_text}] (#{location}) : #{msg}"
  end
end

end

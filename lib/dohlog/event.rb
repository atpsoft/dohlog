require 'dohlog/severity'

module DohLog

class Event
  attr_accessor :severity, :msg, :location, :exception, :extras, :time

  def initialize(severity, msg, location = '', exception = nil)
    @severity, @msg, @location, @exception = severity, msg, location, exception
    @extras = {}
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
    return '' unless @exception
    stack = @exception.backtrace.collect { |elem| "=> #{elem}" }.join("\n")
    "=> exception: #{@exception.class} - #{@exception.message}\n=> stack:\n#{stack}"
  end

  def call_stack
    if @exception then @exception.backtrace else caller end
  end

  def summary
    if @extras.empty?
      extra_str = ''
    else
      extra_ary = []
      @extras.each_pair do |key, value|
        extra_ary << "#{key}: #{value}"
      end
      extra_str = "<#{extra_ary.join(', ')}> "
    end
    threadstr = ":#{Thread.current.object_id}" if DohLog.should_log_thread_ids
    "#{datetime_text} <#{Process.pid}#{threadstr}> [#{severity_text}] (#{location}) #{extra_str}: #{msg}"
  end
end

end

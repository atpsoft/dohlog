require 'net/smtp'

module DohLog

class EmailAcceptor
  # required config fields are :from, :to, :server
  def initialize(config)
    @config = config
    @msg_start = "From:#{config[:from]}\nTo:#{config[:to].join(', ')}\nContent-Type: text/plain\nSubject:"
  end

  def add(event)
    msg = "#{@msg_start}#{event.severity_text}: #{event.msg}\n\n#{event.summary}\n#{event.exception_text}"
    Net::SMTP.start(@config[:server]) do |smtp|
      begin
        smtp.send_message(msg, @config[:from], @config[:to])
      rescue => excpt
        $stderr.puts "DohLog EmailAcceptor send failed: #{excpt}"
      end
    end
  end

  def shutdown
  end
end

end

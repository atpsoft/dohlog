require 'net/smtp'

module DohLog

class EmailAcceptor
  # required config fields are :from, :to, :server
  def initialize(config, &get_details)
    @config = config
    @get_details = get_details
    @msg_start = "From:#{config[:from]}\nTo:#{config[:to].join(', ')}\nContent-Type: text/plain\nSubject:"
  end

  def add(event)
    msg = "#{@msg_start}#{event.severity_text}: #{event.msg}\n\n#{event.summary}\n#{details_text}\n#{event.exception_text}"
    Net::SMTP.start(@config[:server]) do |smtp|
      begin
        smtp.send_message(msg, @config[:from], @config[:to])
      rescue => excpt
        puts "dohlog EmailAcceptor send failed: #{excpt}"
      end
    end
  end

  def shutdown
  end

private
  def details_text
    map = @get_details.call
    lines = []
    map.each_pair do |key, value|
      lines << "#{key}: #{value}"
    end
    lines.join("\n")
  end

end

end

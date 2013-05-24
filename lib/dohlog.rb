require 'dohlog/interface'
require 'dohlog/integrate'
require 'dohlog/stream_acceptor'

module DohLog
extend self
@@log_thread_ids = false

def setup(acceptor)
  DohLog::Interface.setup(acceptor)
end

def shutdown
  DohLog::Interface.shutdown
end

def enable
  DohLog::Interface.enable
end

def disable
  return DohLog::Interface.disable if !block_given?
  DohLog::Interface.disable do
    yield
  end
end

def log_thread_ids(enabled)
  @@log_thread_ids = enabled
end

def should_log_thread_ids
  @@log_thread_ids
end

end

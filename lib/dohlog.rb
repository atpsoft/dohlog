require 'dohlog/interface'
require 'dohlog/integrate'
require 'dohlog/stream_acceptor'

module DohLog
extend self

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
  DohLog::Interface.disable
end

end

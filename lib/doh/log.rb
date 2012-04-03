module DohLog

def self.setup(acceptor)
  require 'doh/log/integrate'
  DohLog::Interface.setup(acceptor)
end

def self.shutdown
  DohLog::Interface.shutdown
end

end

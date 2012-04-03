require 'doh/log/stub'
require 'doh/log/interface'

module DohLog

def self.setup(acceptor)
  require 'doh/log/integrate'
  DohLog::Interface.setup(acceptor)
end

def self.shutdown
  DohLog::Interface.shutdown
end

def self.disable
  return if dohlog == StubInterface
  load 'doh/log/unintegrate.rb'
  load 'doh/log/stub.rb'
end

def self.enable
  return unless dohlog == StubInterface
  load 'doh/log/integrate.rb'
end

end

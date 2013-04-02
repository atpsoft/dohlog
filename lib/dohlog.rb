require 'doh/log/stub'
require 'dohlog/interface'

module DohLog

def self.setup(acceptor)
  require 'dohlog/integrate'
  DohLog::Interface.setup(acceptor)
end

def self.shutdown
  DohLog::Interface.shutdown
end

def self.disable
  return if dohlog == StubInterface
  load 'dohlog/unintegrate.rb'
  load 'doh/log/stub.rb'
end

def self.enable
  return unless dohlog == StubInterface
  load 'dohlog/integrate.rb'
end

end

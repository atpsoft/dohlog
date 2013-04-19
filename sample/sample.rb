#!/usr/bin/env ruby
require 'dohlog'

acceptor = DohLog::StreamAcceptor.new(File.new('dohlog_sample.log', 'w+'))
DohLog::setup(acceptor)
dohlog.debug("hello this some very detailed stuff")
dohlog.info("this is a bit more normal type of thing")
dohlog.warn("uh oh, something could be bad")

begin
  raise "failed to do something important"
rescue => excpt
  dohlog.error("definitely not good", excpt)
end

DohLog::shutdown

#!/usr/bin/env ruby
require 'doh/log'
require 'doh/log/stream_acceptor'

acceptor = DohLog::StreamAcceptor.new(false, File.new('dohlog_sample.log', 'w+'))
DohLog::setup(acceptor)
dohlog.debug("hello this some very detailed stuff")
dohlog.info("this is a bit more normal type of thing")
dohlog.warn("uh oh, something could be bad")

begin
  raise "failed to do something important"
rescue => excpt
  dohlog.error("definitely not good", excpt)
end

begin
  raise "vital stuff couldn't happen"
rescue => excpt
  dohlog.fatal("very very bad", excpt)
end

DohLog::shutdown

DohLog
========

[![Build Status](https://travis-ci.org/atpsoft/dohlog.png)](https://travis-ci.org/atpsoft/dohlog)
[![Code Climate](https://codeclimate.com/github/atpsoft/dohlog.png)](https://codeclimate.com/github/atpsoft/dohlog)

DohLog is a library designed to help simplify logging

A sample exists in the sample directory.

You could also do something like this in a more complicated setup

``` ruby
logfile_name = Util.logfile_name
file_acceptor = DohLog::StreamAcceptor.new(true, open_logfile(logfile_name))
email_acceptor = DohLog::EmailAcceptor.new(:from => Doh.config[:alerts_email], :to => [Doh.config[:alerts_email]], :server => Doh.config[:alerts_smtp_server]) { {:remote_ip => Util.source_ip, :logfile_name => logfile_name, :server => Socket.gethostname} }
filtered_acceptor = DohLog::FilterAcceptor.new(email_acceptor) {|event| event.severity >= DohLog::NOTIFY}
multi_acceptor = DohLog::MultiAcceptor.new(filtered_acceptor, file_acceptor)
DohLog.setup(multi_acceptor)
```

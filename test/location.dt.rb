require 'doh/log'
require 'doh/log/memory_acceptor'

module DohLog

class TestLocation < DohTest::TestGroup
  def test_location
    acceptor = DohLog::MemoryAcceptor.new
    DohLog.setup(acceptor)
    assert_equal(0, acceptor.events.size)
    dohlog.debug("blah")
    assert_equal(self.class.to_s, acceptor.events.first.location)
  end
end

end

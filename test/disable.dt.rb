require 'dohlog'
require 'dohlog/memory_acceptor'

module DohLog

class TestDisable < DohTest::TestGroup
  def test_disable
    acceptor = DohLog::MemoryAcceptor.new
    DohLog.setup(acceptor)
    assert_equal(0, acceptor.events.size)
    dohlog.debug("blah")
    assert_equal(1, acceptor.events.size)
    dohlog.debug("blah")
    assert_equal(2, acceptor.events.size)
    DohLog.disable
    dohlog.debug("blah")
    assert_equal(2, acceptor.events.size)
    DohLog.disable
    dohlog.debug("blah")
    assert_equal(2, acceptor.events.size)
    DohLog.enable
    dohlog.debug("blah")
    assert_equal(3, acceptor.events.size)
    DohLog.enable
    dohlog.debug("blah")
    assert_equal(4, acceptor.events.size)
    DohLog.disable
    dohlog.debug("blah")
    assert_equal(4, acceptor.events.size)
    DohLog.disable
    dohlog.debug("blah")
    assert_equal(4, acceptor.events.size)
    DohLog.enable
    dohlog.debug("blah")
    assert_equal(5, acceptor.events.size)
    DohLog.enable
    dohlog.debug("blah")
    assert_equal(6, acceptor.events.size)
    DohLog.disable
    dohlog.debug("blah")
    assert_equal(6, acceptor.events.size)
    DohLog.enable
  end
end

end

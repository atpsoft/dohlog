class Module
  undef dohlog
  def dohlog
    @dohlog ||= DohLog::Interface.new(self.to_s)
  end
end

class Object
  undef dohlog
  def dohlog
    self.class.dohlog
  end
end

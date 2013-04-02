class Module
  def dohlog
    @dohlog ||= DohLog::Interface.new(self.to_s)
  end
end

class Object
  def dohlog
    self.class.dohlog
  end
end

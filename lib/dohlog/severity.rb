module DohLog

DEBUG = 0
INFO = 1
NOTIFY = 2
WARN = 3
ERROR = 4
FATAL = 5
SEVERITY_LEVELS = %w(debug info NOTIFY WARNING ERROR ***FATAL***)

def self.severity_text(level)
  SEVERITY_LEVELS[level]
end

end

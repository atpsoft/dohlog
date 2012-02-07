module DohLog

DEBUG = 0
INFO = 1
WARN = 2
ERROR = 3
FATAL = 4
SEVERITY_LEVELS = %w(debug info WARNING ERROR ***FATAL***)

def self.severity_text(level)
  SEVERITY_LEVELS[level]
end

end

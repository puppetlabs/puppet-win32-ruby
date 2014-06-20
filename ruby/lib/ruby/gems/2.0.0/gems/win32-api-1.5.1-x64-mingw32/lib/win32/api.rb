if RUBY_VERSION.to_f < 1.9
  require File.join(File.dirname(__FILE__), 'ruby18/win32/api')
elsif RUBY_VERSION.to_f < 2.0
  require File.join(File.dirname(__FILE__), 'ruby19/win32/api')
else
  require 'rbconfig'
  if RbConfig::CONFIG['arch'] =~ /x64/i
    require File.join(File.dirname(__FILE__), 'ruby2_64/win32/api')
  else
    require File.join(File.dirname(__FILE__), 'ruby2_32/win32/api')
  end
end

require 'dl.so'

begin
  require 'fiddle' unless Object.const_defined?(:Fiddle)
rescue LoadError
end

# http://stackoverflow.com/questions/15590450/ruby-2-0-0p0-irb-error-dl-is-deprecated-please-use-fiddle
# warn "DL is deprecated, please use Fiddle"

module DL
  # Returns true if DL is using Fiddle, the libffi wrapper.
  def self.fiddle?
    Object.const_defined?(:Fiddle)
  end
end

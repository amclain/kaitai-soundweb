# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# BSS Soundweb protocol
class Soundweb < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @stx = @_io.ensure_fixed_contents([2].pack('C*'))
    @message = @_io.read_bytes_term(3, false, false, true)
    @etx = @_io.ensure_fixed_contents([3].pack('C*'))
    self
  end
  attr_reader :stx
  attr_reader :message
  attr_reader :etx
end

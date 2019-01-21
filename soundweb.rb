# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# BSS Soundweb protocol
class Soundweb < Kaitai::Struct::Struct

  COMAMND = {
    136 => :comamnd_setsv,
    137 => :comamnd_subscribesv,
    138 => :comamnd_unsubscribesv,
    139 => :comamnd_venue_preset_recall,
    140 => :comamnd_param_preset_recall,
    141 => :comamnd_setsvpercent,
    142 => :comamnd_subscribesvpercent,
    143 => :comamnd_unsubscribesvpercent,
    144 => :comamnd_bumpsvpercent,
  }
  I__COMAMND = COMAMND.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @stx = @_io.ensure_fixed_contents([2].pack('C*'))
    @_raw__raw_message = @_io.read_bytes_term(3, false, false, true)
    _process = UnescapeMessage.new()
    @_raw_message = _process.decode(@_raw__raw_message)
    io = Kaitai::Struct::Stream.new(@_raw_message)
    @message = Message.new(io, self, @_root)
    @etx = @_io.ensure_fixed_contents([3].pack('C*'))
    self
  end
  class Message < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @body = Body.new(@_io, self, @_root)
      @checksum = @_io.read_u1
      self
    end
    attr_reader :body
    attr_reader :checksum
  end
  class Body < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @command = Kaitai::Struct::Stream::resolve_enum(Soundweb::COMAMND, @_io.read_u1)
      @node = @_io.read_u2be
      @virtual_device = @_io.read_u1
      @object = @_io.read_bytes(3)
      @state_variable = @_io.read_u2be
      @data = @_io.read_u4be
      self
    end
    attr_reader :command
    attr_reader :node
    attr_reader :virtual_device
    attr_reader :object
    attr_reader :state_variable
    attr_reader :data
  end
  attr_reader :stx
  attr_reader :message
  attr_reader :etx
  attr_reader :_raw_message
  attr_reader :_raw__raw_message
end

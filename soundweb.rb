# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# BSS Soundweb protocol
class Soundweb < Kaitai::Struct::Struct

  COMMAND = {
    136 => :command_setsv,
    137 => :command_subscribesv,
    138 => :command_unsubscribesv,
    139 => :command_venue_preset_recall,
    140 => :command_param_preset_recall,
    141 => :command_setsvpercent,
    142 => :command_subscribesvpercent,
    143 => :command_unsubscribesvpercent,
    144 => :command_bumpsvpercent,
  }
  I__COMMAND = COMMAND.invert
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
      @command = Kaitai::Struct::Stream::resolve_enum(Soundweb::COMMAND, @_io.read_u1)
      case command
      when :command_unsubscribesvpercent
        @body = ObjectBody.new(@_io, self, @_root)
      when :command_subscribesvpercent
        @body = ObjectBody.new(@_io, self, @_root)
      when :command_bumpsvpercent
        @body = ObjectBody.new(@_io, self, @_root)
      when :command_setsv
        @body = ObjectBody.new(@_io, self, @_root)
      when :command_venue_preset_recall
        @body = PresetBody.new(@_io, self, @_root)
      when :command_param_preset_recall
        @body = PresetBody.new(@_io, self, @_root)
      when :command_unsubscribesv
        @body = ObjectBody.new(@_io, self, @_root)
      when :command_subscribesv
        @body = ObjectBody.new(@_io, self, @_root)
      when :command_setsvpercent
        @body = ObjectBody.new(@_io, self, @_root)
      end
      @checksum = @_io.read_u1
      self
    end
    attr_reader :command
    attr_reader :body
    attr_reader :checksum
  end
  class ObjectBody < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @node = @_io.read_u2be
      @virtual_device = @_io.read_u1
      @object = @_io.read_bits_int(24)
      @_io.align_to_byte
      @state_variable = @_io.read_u2be
      @data = @_io.read_u4be
      self
    end
    def percentage
      return @percentage unless @percentage.nil?
      @percentage = (data / 65536.0)
      @percentage
    end
    attr_reader :node
    attr_reader :virtual_device
    attr_reader :object
    attr_reader :state_variable
    attr_reader :data
  end
  class PresetBody < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @data = @_io.read_u4be
      self
    end
    attr_reader :data
  end
  attr_reader :stx
  attr_reader :message
  attr_reader :etx
  attr_reader :_raw_message
  attr_reader :_raw__raw_message
end

#! /usr/bin/env ruby

require "./soundweb"

class Soundweb::UnescapeMessage
  def decode(message)
    do_escape = false

    message
      .unpack("C*")
      .reduce([]) { |acc, memo|
        if do_escape
          do_escape = false
          acc << (memo - 0x80)
        else
          if memo == 0x1B
            do_escape = true
          else
            acc << memo
          end
        end

        acc
      }
      .pack("C*")
  end
end

# Soundweb packet.
packet = [0x02, 0x8D, 0x10, 0x01, 0x1B, 0x83, 0x00, 0x01, 0x37, 0x00, 0x00, 0x00, 0x00, 0xD7, 0x1D, 0x63, 0x03]
  .pack("C*").force_encoding("ASCII-8BIT")

stream = Kaitai::Struct::Stream.new(packet)
data = Soundweb.new(stream)

require "pry"; binding.pry

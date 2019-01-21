doc: BSS Soundweb protocol
meta:
  id: soundweb
  endian: be
seq:
  - id: stx
    contents: [0x02]
  - id: message
    terminator: 0x03
    consume: false
    process: unescape_message
  - id: etx
    contents: [0x03]

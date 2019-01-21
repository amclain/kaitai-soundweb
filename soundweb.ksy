doc: BSS Soundweb protocol
meta:
  id: soundweb
  endian: be
seq:
  - id: stx
    contents: [0x02]
  - id: message
    type: message
    terminator: 0x03
    consume: false
    process: unescape_message
  - id: etx
    contents: [0x03]
types:
  message:
    seq:
      - id: body
        type: body
      - id: checksum
        type: u1
        # TODO: checksum valid? ############################################
  body:
    seq:
      - id: command
        type: u1
        enum: comamnd
      - id: node
        type: u2
      - id: virtual_device
        type: u1
      - id: object
        # type: u4
        size: 3
      - id: state_variable
        type: u2
      - id: data
        type: u4
        # TODO: CASE ###########################################
enums:
  comamnd:
    0x88: setsv
    0x89: subscribesv
    0x8A: unsubscribesv
    0x8B: venue_preset_recall
    0x8C: param_preset_recall
    0x8D: setsvpercent
    0x8E: subscribesvpercent
    0x8F: unsubscribesvpercent
    0x90: bumpsvpercent

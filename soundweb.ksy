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
      - id: command
        type: u1
        enum: command
      - id: body
        type:
          switch-on: command
          cases:
            command::setsv: object_body
            command::subscribesv: object_body
            command::unsubscribesv: object_body
            command::venue_preset_recall: preset_body
            command::param_preset_recall: preset_body
            command::setsvpercent: object_body
            command::subscribesvpercent: object_body
            command::unsubscribesvpercent: object_body
            command::bumpsvpercent: object_body
      - id: checksum
        type: u1
        # TODO: checksum valid? ############################################
  object_body:
    seq:
      - id: node
        type: u2
      - id: virtual_device
        type: u1
      - id: object
        type: b24
      - id: state_variable
        type: u2
      - id: data
        type: u4
    instances:
      percentage:
        value: data / 65536.0
  preset_body:
    seq:
      - id: data
        type: u4
enums:
  command:
    0x88: setsv
    0x89: subscribesv
    0x8A: unsubscribesv
    0x8B: venue_preset_recall
    0x8C: param_preset_recall
    0x8D: setsvpercent
    0x8E: subscribesvpercent
    0x8F: unsubscribesvpercent
    0x90: bumpsvpercent

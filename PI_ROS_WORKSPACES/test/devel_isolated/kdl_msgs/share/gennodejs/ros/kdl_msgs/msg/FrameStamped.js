// Auto-generated. Do not edit!

// (in-package kdl_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Frame = require('./Frame.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class FrameStamped {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.frame = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('frame')) {
        this.frame = initObj.frame
      }
      else {
        this.frame = new Frame();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type FrameStamped
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [frame]
    bufferOffset = Frame.serialize(obj.frame, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type FrameStamped
    let len;
    let data = new FrameStamped(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [frame]
    data.frame = Frame.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 96;
  }

  static datatype() {
    // Returns string type for a message object
    return 'kdl_msgs/FrameStamped';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '44e83f9a1d6f6e367ebd23d6403853f1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Represents a stamped KDL::Frame instance.
    
    Header header
    Frame frame
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    # 0: no frame
    # 1: global frame
    string frame_id
    
    ================================================================================
    MSG: kdl_msgs/Frame
    # Represents a KDL::Frame instance.
    
    Vector p
    Rotation M
    
    ================================================================================
    MSG: kdl_msgs/Vector
    # Represents a KDL::Vector instance.
    # This message is compatible to geometry_msgs/Vector3.
    
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: kdl_msgs/Rotation
    # Represents a KDL::Rotation instance.
    
    float64[9] data
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new FrameStamped(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.frame !== undefined) {
      resolved.frame = Frame.Resolve(msg.frame)
    }
    else {
      resolved.frame = new Frame()
    }

    return resolved;
    }
};

module.exports = FrameStamped;

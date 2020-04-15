// Auto-generated. Do not edit!

// (in-package kdl_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Vector = require('./Vector.js');
let Rotation = require('./Rotation.js');

//-----------------------------------------------------------

class Frame {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.p = null;
      this.M = null;
    }
    else {
      if (initObj.hasOwnProperty('p')) {
        this.p = initObj.p
      }
      else {
        this.p = new Vector();
      }
      if (initObj.hasOwnProperty('M')) {
        this.M = initObj.M
      }
      else {
        this.M = new Rotation();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Frame
    // Serialize message field [p]
    bufferOffset = Vector.serialize(obj.p, buffer, bufferOffset);
    // Serialize message field [M]
    bufferOffset = Rotation.serialize(obj.M, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Frame
    let len;
    let data = new Frame(null);
    // Deserialize message field [p]
    data.p = Vector.deserialize(buffer, bufferOffset);
    // Deserialize message field [M]
    data.M = Rotation.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 96;
  }

  static datatype() {
    // Returns string type for a message object
    return 'kdl_msgs/Frame';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8fafbf9f5543db8a3b54001d19dc815d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new Frame(null);
    if (msg.p !== undefined) {
      resolved.p = Vector.Resolve(msg.p)
    }
    else {
      resolved.p = new Vector()
    }

    if (msg.M !== undefined) {
      resolved.M = Rotation.Resolve(msg.M)
    }
    else {
      resolved.M = new Rotation()
    }

    return resolved;
    }
};

module.exports = Frame;

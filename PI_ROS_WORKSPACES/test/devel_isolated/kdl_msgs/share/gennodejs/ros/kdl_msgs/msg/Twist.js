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

//-----------------------------------------------------------

class Twist {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.linear = null;
      this.angular = null;
    }
    else {
      if (initObj.hasOwnProperty('linear')) {
        this.linear = initObj.linear
      }
      else {
        this.linear = new Vector();
      }
      if (initObj.hasOwnProperty('angular')) {
        this.angular = initObj.angular
      }
      else {
        this.angular = new Vector();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Twist
    // Serialize message field [linear]
    bufferOffset = Vector.serialize(obj.linear, buffer, bufferOffset);
    // Serialize message field [angular]
    bufferOffset = Vector.serialize(obj.angular, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Twist
    let len;
    let data = new Twist(null);
    // Deserialize message field [linear]
    data.linear = Vector.deserialize(buffer, bufferOffset);
    // Deserialize message field [angular]
    data.angular = Vector.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 48;
  }

  static datatype() {
    // Returns string type for a message object
    return 'kdl_msgs/Twist';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9f195f881246fdfa2798d1d3eebca84a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Represents a KDL::Twist instance.
    # This message is compatible to geometry_msgs/Twist.
    
    Vector linear
    Vector angular
    
    ================================================================================
    MSG: kdl_msgs/Vector
    # Represents a KDL::Vector instance.
    # This message is compatible to geometry_msgs/Vector3.
    
    float64 x
    float64 y
    float64 z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Twist(null);
    if (msg.linear !== undefined) {
      resolved.linear = Vector.Resolve(msg.linear)
    }
    else {
      resolved.linear = new Vector()
    }

    if (msg.angular !== undefined) {
      resolved.angular = Vector.Resolve(msg.angular)
    }
    else {
      resolved.angular = new Vector()
    }

    return resolved;
    }
};

module.exports = Twist;

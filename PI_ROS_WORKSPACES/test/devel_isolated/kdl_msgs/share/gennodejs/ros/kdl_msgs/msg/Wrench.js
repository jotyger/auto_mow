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

class Wrench {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.force = null;
      this.torque = null;
    }
    else {
      if (initObj.hasOwnProperty('force')) {
        this.force = initObj.force
      }
      else {
        this.force = new Vector();
      }
      if (initObj.hasOwnProperty('torque')) {
        this.torque = initObj.torque
      }
      else {
        this.torque = new Vector();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Wrench
    // Serialize message field [force]
    bufferOffset = Vector.serialize(obj.force, buffer, bufferOffset);
    // Serialize message field [torque]
    bufferOffset = Vector.serialize(obj.torque, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Wrench
    let len;
    let data = new Wrench(null);
    // Deserialize message field [force]
    data.force = Vector.deserialize(buffer, bufferOffset);
    // Deserialize message field [torque]
    data.torque = Vector.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 48;
  }

  static datatype() {
    // Returns string type for a message object
    return 'kdl_msgs/Wrench';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4f539cf138b23283b520fd271b567936';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Represents a KDL::Wrench instance.
    # This message is compatible to geometry_msgs/Wrench.
    
    Vector force
    Vector torque
    
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
    const resolved = new Wrench(null);
    if (msg.force !== undefined) {
      resolved.force = Vector.Resolve(msg.force)
    }
    else {
      resolved.force = new Vector()
    }

    if (msg.torque !== undefined) {
      resolved.torque = Vector.Resolve(msg.torque)
    }
    else {
      resolved.torque = new Vector()
    }

    return resolved;
    }
};

module.exports = Wrench;

// Auto-generated. Do not edit!

// (in-package pt_actions.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class NavigateGoal {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.lats = null;
      this.lons = null;
      this.loops = null;
      this.auto_size = null;
      this.lookahead_distance = null;
      this.max_angular_speed = null;
      this.threshold = null;
      this.desired_speed = null;
      this.start_point = null;
    }
    else {
      if (initObj.hasOwnProperty('lats')) {
        this.lats = initObj.lats
      }
      else {
        this.lats = [];
      }
      if (initObj.hasOwnProperty('lons')) {
        this.lons = initObj.lons
      }
      else {
        this.lons = [];
      }
      if (initObj.hasOwnProperty('loops')) {
        this.loops = initObj.loops
      }
      else {
        this.loops = 0;
      }
      if (initObj.hasOwnProperty('auto_size')) {
        this.auto_size = initObj.auto_size
      }
      else {
        this.auto_size = 0.0;
      }
      if (initObj.hasOwnProperty('lookahead_distance')) {
        this.lookahead_distance = initObj.lookahead_distance
      }
      else {
        this.lookahead_distance = 0.0;
      }
      if (initObj.hasOwnProperty('max_angular_speed')) {
        this.max_angular_speed = initObj.max_angular_speed
      }
      else {
        this.max_angular_speed = 0.0;
      }
      if (initObj.hasOwnProperty('threshold')) {
        this.threshold = initObj.threshold
      }
      else {
        this.threshold = 0.0;
      }
      if (initObj.hasOwnProperty('desired_speed')) {
        this.desired_speed = initObj.desired_speed
      }
      else {
        this.desired_speed = 0.0;
      }
      if (initObj.hasOwnProperty('start_point')) {
        this.start_point = initObj.start_point
      }
      else {
        this.start_point = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type NavigateGoal
    // Serialize message field [lats]
    bufferOffset = _arraySerializer.float64(obj.lats, buffer, bufferOffset, null);
    // Serialize message field [lons]
    bufferOffset = _arraySerializer.float64(obj.lons, buffer, bufferOffset, null);
    // Serialize message field [loops]
    bufferOffset = _serializer.uint8(obj.loops, buffer, bufferOffset);
    // Serialize message field [auto_size]
    bufferOffset = _serializer.float64(obj.auto_size, buffer, bufferOffset);
    // Serialize message field [lookahead_distance]
    bufferOffset = _serializer.float64(obj.lookahead_distance, buffer, bufferOffset);
    // Serialize message field [max_angular_speed]
    bufferOffset = _serializer.float64(obj.max_angular_speed, buffer, bufferOffset);
    // Serialize message field [threshold]
    bufferOffset = _serializer.float64(obj.threshold, buffer, bufferOffset);
    // Serialize message field [desired_speed]
    bufferOffset = _serializer.float64(obj.desired_speed, buffer, bufferOffset);
    // Serialize message field [start_point]
    bufferOffset = _serializer.uint8(obj.start_point, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type NavigateGoal
    let len;
    let data = new NavigateGoal(null);
    // Deserialize message field [lats]
    data.lats = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [lons]
    data.lons = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [loops]
    data.loops = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [auto_size]
    data.auto_size = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [lookahead_distance]
    data.lookahead_distance = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [max_angular_speed]
    data.max_angular_speed = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [threshold]
    data.threshold = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [desired_speed]
    data.desired_speed = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [start_point]
    data.start_point = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.lats.length;
    length += 8 * object.lons.length;
    return length + 50;
  }

  static datatype() {
    // Returns string type for a message object
    return 'pt_actions/NavigateGoal';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a6de8548f9f5a7b985ca39ba834dfdb4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
    # Define the Goal
    #The latitudes and longitudes of the points to travel to.
    #Starting location is at index 0, First point
    #to travel to is at index 1 
    float64[] lats
    float64[] lons 
    #The number of loops to do around the points
    uint8 loops 
    
    #The square size for auto generating points
    float64 auto_size
    
    #The lookahead distance for the
    #Pure Pursuit Controller. higher values
    #cause the rover to converge to path more
    #slowly
    float64 lookahead_distance
    float64 max_angular_speed
    float64 threshold
    #The desired speed to drive along
    #the path
    float64 desired_speed
    
    #The start point index in the path
    uint8 start_point
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new NavigateGoal(null);
    if (msg.lats !== undefined) {
      resolved.lats = msg.lats;
    }
    else {
      resolved.lats = []
    }

    if (msg.lons !== undefined) {
      resolved.lons = msg.lons;
    }
    else {
      resolved.lons = []
    }

    if (msg.loops !== undefined) {
      resolved.loops = msg.loops;
    }
    else {
      resolved.loops = 0
    }

    if (msg.auto_size !== undefined) {
      resolved.auto_size = msg.auto_size;
    }
    else {
      resolved.auto_size = 0.0
    }

    if (msg.lookahead_distance !== undefined) {
      resolved.lookahead_distance = msg.lookahead_distance;
    }
    else {
      resolved.lookahead_distance = 0.0
    }

    if (msg.max_angular_speed !== undefined) {
      resolved.max_angular_speed = msg.max_angular_speed;
    }
    else {
      resolved.max_angular_speed = 0.0
    }

    if (msg.threshold !== undefined) {
      resolved.threshold = msg.threshold;
    }
    else {
      resolved.threshold = 0.0
    }

    if (msg.desired_speed !== undefined) {
      resolved.desired_speed = msg.desired_speed;
    }
    else {
      resolved.desired_speed = 0.0
    }

    if (msg.start_point !== undefined) {
      resolved.start_point = msg.start_point;
    }
    else {
      resolved.start_point = 0
    }

    return resolved;
    }
};

module.exports = NavigateGoal;

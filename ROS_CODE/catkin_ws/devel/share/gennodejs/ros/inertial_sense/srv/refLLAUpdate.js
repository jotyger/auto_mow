// Auto-generated. Do not edit!

// (in-package inertial_sense.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class refLLAUpdateRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.lla = null;
    }
    else {
      if (initObj.hasOwnProperty('lla')) {
        this.lla = initObj.lla
      }
      else {
        this.lla = new Array(3).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type refLLAUpdateRequest
    // Check that the constant length array field [lla] has the right length
    if (obj.lla.length !== 3) {
      throw new Error('Unable to serialize array field lla - length must be 3')
    }
    // Serialize message field [lla]
    bufferOffset = _arraySerializer.float64(obj.lla, buffer, bufferOffset, 3);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type refLLAUpdateRequest
    let len;
    let data = new refLLAUpdateRequest(null);
    // Deserialize message field [lla]
    data.lla = _arrayDeserializer.float64(buffer, bufferOffset, 3)
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a service object
    return 'inertial_sense/refLLAUpdateRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'bcedbfd23400dfab69127aa7e23f992b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[3] lla
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new refLLAUpdateRequest(null);
    if (msg.lla !== undefined) {
      resolved.lla = msg.lla;
    }
    else {
      resolved.lla = new Array(3).fill(0)
    }

    return resolved;
    }
};

class refLLAUpdateResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type refLLAUpdateResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type refLLAUpdateResponse
    let len;
    let data = new refLLAUpdateResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'inertial_sense/refLLAUpdateResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '358e233cde0c8a8bcfea4ce193f8fc15';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool success
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new refLLAUpdateResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    return resolved;
    }
};

module.exports = {
  Request: refLLAUpdateRequest,
  Response: refLLAUpdateResponse,
  md5sum() { return '5a918f5427bcbd7ecd160c9b61300277'; },
  datatype() { return 'inertial_sense/refLLAUpdate'; }
};

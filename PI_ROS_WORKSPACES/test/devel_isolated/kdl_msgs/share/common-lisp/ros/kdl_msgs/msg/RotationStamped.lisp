; Auto-generated. Do not edit!


(cl:in-package kdl_msgs-msg)


;//! \htmlinclude RotationStamped.msg.html

(cl:defclass <RotationStamped> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (rotation
    :reader rotation
    :initarg :rotation
    :type kdl_msgs-msg:Rotation
    :initform (cl:make-instance 'kdl_msgs-msg:Rotation)))
)

(cl:defclass RotationStamped (<RotationStamped>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RotationStamped>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RotationStamped)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name kdl_msgs-msg:<RotationStamped> is deprecated: use kdl_msgs-msg:RotationStamped instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <RotationStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kdl_msgs-msg:header-val is deprecated.  Use kdl_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'rotation-val :lambda-list '(m))
(cl:defmethod rotation-val ((m <RotationStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kdl_msgs-msg:rotation-val is deprecated.  Use kdl_msgs-msg:rotation instead.")
  (rotation m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RotationStamped>) ostream)
  "Serializes a message object of type '<RotationStamped>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'rotation) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RotationStamped>) istream)
  "Deserializes a message object of type '<RotationStamped>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'rotation) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RotationStamped>)))
  "Returns string type for a message object of type '<RotationStamped>"
  "kdl_msgs/RotationStamped")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RotationStamped)))
  "Returns string type for a message object of type 'RotationStamped"
  "kdl_msgs/RotationStamped")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RotationStamped>)))
  "Returns md5sum for a message object of type '<RotationStamped>"
  "f0314fdaba929afcefc0f8476c959fec")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RotationStamped)))
  "Returns md5sum for a message object of type 'RotationStamped"
  "f0314fdaba929afcefc0f8476c959fec")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RotationStamped>)))
  "Returns full string definition for message of type '<RotationStamped>"
  (cl:format cl:nil "# Represents a stamped KDL::Rotation instance.~%~%Header header~%Rotation rotation~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: kdl_msgs/Rotation~%# Represents a KDL::Rotation instance.~%~%float64[9] data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RotationStamped)))
  "Returns full string definition for message of type 'RotationStamped"
  (cl:format cl:nil "# Represents a stamped KDL::Rotation instance.~%~%Header header~%Rotation rotation~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: kdl_msgs/Rotation~%# Represents a KDL::Rotation instance.~%~%float64[9] data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RotationStamped>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'rotation))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RotationStamped>))
  "Converts a ROS message object to a list"
  (cl:list 'RotationStamped
    (cl:cons ':header (header msg))
    (cl:cons ':rotation (rotation msg))
))

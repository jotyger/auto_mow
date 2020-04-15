; Auto-generated. Do not edit!


(cl:in-package kdl_msgs-msg)


;//! \htmlinclude JntArrayStamped.msg.html

(cl:defclass <JntArrayStamped> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (joints
    :reader joints
    :initarg :joints
    :type kdl_msgs-msg:JntArray
    :initform (cl:make-instance 'kdl_msgs-msg:JntArray)))
)

(cl:defclass JntArrayStamped (<JntArrayStamped>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <JntArrayStamped>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'JntArrayStamped)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name kdl_msgs-msg:<JntArrayStamped> is deprecated: use kdl_msgs-msg:JntArrayStamped instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <JntArrayStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kdl_msgs-msg:header-val is deprecated.  Use kdl_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'joints-val :lambda-list '(m))
(cl:defmethod joints-val ((m <JntArrayStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kdl_msgs-msg:joints-val is deprecated.  Use kdl_msgs-msg:joints instead.")
  (joints m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <JntArrayStamped>) ostream)
  "Serializes a message object of type '<JntArrayStamped>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'joints) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <JntArrayStamped>) istream)
  "Deserializes a message object of type '<JntArrayStamped>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'joints) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<JntArrayStamped>)))
  "Returns string type for a message object of type '<JntArrayStamped>"
  "kdl_msgs/JntArrayStamped")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'JntArrayStamped)))
  "Returns string type for a message object of type 'JntArrayStamped"
  "kdl_msgs/JntArrayStamped")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<JntArrayStamped>)))
  "Returns md5sum for a message object of type '<JntArrayStamped>"
  "bc6436c1eca974e807d4ae33aab49725")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'JntArrayStamped)))
  "Returns md5sum for a message object of type 'JntArrayStamped"
  "bc6436c1eca974e807d4ae33aab49725")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<JntArrayStamped>)))
  "Returns full string definition for message of type '<JntArrayStamped>"
  (cl:format cl:nil "# Represents a stamped KDL::JntArray instance.~%~%Header header~%JntArray joints~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: kdl_msgs/JntArray~%# Represents a KDL::JntArray instance.~%~%float64[] data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'JntArrayStamped)))
  "Returns full string definition for message of type 'JntArrayStamped"
  (cl:format cl:nil "# Represents a stamped KDL::JntArray instance.~%~%Header header~%JntArray joints~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: kdl_msgs/JntArray~%# Represents a KDL::JntArray instance.~%~%float64[] data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <JntArrayStamped>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'joints))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <JntArrayStamped>))
  "Converts a ROS message object to a list"
  (cl:list 'JntArrayStamped
    (cl:cons ':header (header msg))
    (cl:cons ':joints (joints msg))
))

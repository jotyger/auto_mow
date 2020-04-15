; Auto-generated. Do not edit!


(cl:in-package kdl_msgs-msg)


;//! \htmlinclude Frame.msg.html

(cl:defclass <Frame> (roslisp-msg-protocol:ros-message)
  ((p
    :reader p
    :initarg :p
    :type kdl_msgs-msg:Vector
    :initform (cl:make-instance 'kdl_msgs-msg:Vector))
   (M
    :reader M
    :initarg :M
    :type kdl_msgs-msg:Rotation
    :initform (cl:make-instance 'kdl_msgs-msg:Rotation)))
)

(cl:defclass Frame (<Frame>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Frame>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Frame)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name kdl_msgs-msg:<Frame> is deprecated: use kdl_msgs-msg:Frame instead.")))

(cl:ensure-generic-function 'p-val :lambda-list '(m))
(cl:defmethod p-val ((m <Frame>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kdl_msgs-msg:p-val is deprecated.  Use kdl_msgs-msg:p instead.")
  (p m))

(cl:ensure-generic-function 'M-val :lambda-list '(m))
(cl:defmethod M-val ((m <Frame>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kdl_msgs-msg:M-val is deprecated.  Use kdl_msgs-msg:M instead.")
  (M m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Frame>) ostream)
  "Serializes a message object of type '<Frame>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'p) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'M) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Frame>) istream)
  "Deserializes a message object of type '<Frame>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'p) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'M) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Frame>)))
  "Returns string type for a message object of type '<Frame>"
  "kdl_msgs/Frame")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Frame)))
  "Returns string type for a message object of type 'Frame"
  "kdl_msgs/Frame")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Frame>)))
  "Returns md5sum for a message object of type '<Frame>"
  "8fafbf9f5543db8a3b54001d19dc815d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Frame)))
  "Returns md5sum for a message object of type 'Frame"
  "8fafbf9f5543db8a3b54001d19dc815d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Frame>)))
  "Returns full string definition for message of type '<Frame>"
  (cl:format cl:nil "# Represents a KDL::Frame instance.~%~%Vector p~%Rotation M~%~%================================================================================~%MSG: kdl_msgs/Vector~%# Represents a KDL::Vector instance.~%# This message is compatible to geometry_msgs/Vector3.~%~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: kdl_msgs/Rotation~%# Represents a KDL::Rotation instance.~%~%float64[9] data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Frame)))
  "Returns full string definition for message of type 'Frame"
  (cl:format cl:nil "# Represents a KDL::Frame instance.~%~%Vector p~%Rotation M~%~%================================================================================~%MSG: kdl_msgs/Vector~%# Represents a KDL::Vector instance.~%# This message is compatible to geometry_msgs/Vector3.~%~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: kdl_msgs/Rotation~%# Represents a KDL::Rotation instance.~%~%float64[9] data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Frame>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'p))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'M))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Frame>))
  "Converts a ROS message object to a list"
  (cl:list 'Frame
    (cl:cons ':p (p msg))
    (cl:cons ':M (M msg))
))

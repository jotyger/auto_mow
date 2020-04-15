; Auto-generated. Do not edit!


(cl:in-package kdl_msgs-msg)


;//! \htmlinclude Twist.msg.html

(cl:defclass <Twist> (roslisp-msg-protocol:ros-message)
  ((linear
    :reader linear
    :initarg :linear
    :type kdl_msgs-msg:Vector
    :initform (cl:make-instance 'kdl_msgs-msg:Vector))
   (angular
    :reader angular
    :initarg :angular
    :type kdl_msgs-msg:Vector
    :initform (cl:make-instance 'kdl_msgs-msg:Vector)))
)

(cl:defclass Twist (<Twist>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Twist>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Twist)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name kdl_msgs-msg:<Twist> is deprecated: use kdl_msgs-msg:Twist instead.")))

(cl:ensure-generic-function 'linear-val :lambda-list '(m))
(cl:defmethod linear-val ((m <Twist>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kdl_msgs-msg:linear-val is deprecated.  Use kdl_msgs-msg:linear instead.")
  (linear m))

(cl:ensure-generic-function 'angular-val :lambda-list '(m))
(cl:defmethod angular-val ((m <Twist>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kdl_msgs-msg:angular-val is deprecated.  Use kdl_msgs-msg:angular instead.")
  (angular m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Twist>) ostream)
  "Serializes a message object of type '<Twist>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'linear) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'angular) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Twist>) istream)
  "Deserializes a message object of type '<Twist>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'linear) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'angular) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Twist>)))
  "Returns string type for a message object of type '<Twist>"
  "kdl_msgs/Twist")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Twist)))
  "Returns string type for a message object of type 'Twist"
  "kdl_msgs/Twist")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Twist>)))
  "Returns md5sum for a message object of type '<Twist>"
  "9f195f881246fdfa2798d1d3eebca84a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Twist)))
  "Returns md5sum for a message object of type 'Twist"
  "9f195f881246fdfa2798d1d3eebca84a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Twist>)))
  "Returns full string definition for message of type '<Twist>"
  (cl:format cl:nil "# Represents a KDL::Twist instance.~%# This message is compatible to geometry_msgs/Twist.~%~%Vector linear~%Vector angular~%~%================================================================================~%MSG: kdl_msgs/Vector~%# Represents a KDL::Vector instance.~%# This message is compatible to geometry_msgs/Vector3.~%~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Twist)))
  "Returns full string definition for message of type 'Twist"
  (cl:format cl:nil "# Represents a KDL::Twist instance.~%# This message is compatible to geometry_msgs/Twist.~%~%Vector linear~%Vector angular~%~%================================================================================~%MSG: kdl_msgs/Vector~%# Represents a KDL::Vector instance.~%# This message is compatible to geometry_msgs/Vector3.~%~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Twist>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'linear))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'angular))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Twist>))
  "Converts a ROS message object to a list"
  (cl:list 'Twist
    (cl:cons ':linear (linear msg))
    (cl:cons ':angular (angular msg))
))

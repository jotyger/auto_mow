; Auto-generated. Do not edit!


(cl:in-package kdl_msgs-msg)


;//! \htmlinclude Rotation.msg.html

(cl:defclass <Rotation> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type (cl:vector cl:float)
   :initform (cl:make-array 9 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass Rotation (<Rotation>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Rotation>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Rotation)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name kdl_msgs-msg:<Rotation> is deprecated: use kdl_msgs-msg:Rotation instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <Rotation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader kdl_msgs-msg:data-val is deprecated.  Use kdl_msgs-msg:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Rotation>) ostream)
  "Serializes a message object of type '<Rotation>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Rotation>) istream)
  "Deserializes a message object of type '<Rotation>"
  (cl:setf (cl:slot-value msg 'data) (cl:make-array 9))
  (cl:let ((vals (cl:slot-value msg 'data)))
    (cl:dotimes (i 9)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Rotation>)))
  "Returns string type for a message object of type '<Rotation>"
  "kdl_msgs/Rotation")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Rotation)))
  "Returns string type for a message object of type 'Rotation"
  "kdl_msgs/Rotation")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Rotation>)))
  "Returns md5sum for a message object of type '<Rotation>"
  "ca66b32e4ad9de837a30ea9fe5ade752")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Rotation)))
  "Returns md5sum for a message object of type 'Rotation"
  "ca66b32e4ad9de837a30ea9fe5ade752")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Rotation>)))
  "Returns full string definition for message of type '<Rotation>"
  (cl:format cl:nil "# Represents a KDL::Rotation instance.~%~%float64[9] data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Rotation)))
  "Returns full string definition for message of type 'Rotation"
  (cl:format cl:nil "# Represents a KDL::Rotation instance.~%~%float64[9] data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Rotation>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Rotation>))
  "Converts a ROS message object to a list"
  (cl:list 'Rotation
    (cl:cons ':data (data msg))
))

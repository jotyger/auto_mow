; Auto-generated. Do not edit!


(cl:in-package pt_actions-msg)


;//! \htmlinclude NavigateResult.msg.html

(cl:defclass <NavigateResult> (roslisp-msg-protocol:ros-message)
  ((end_lat
    :reader end_lat
    :initarg :end_lat
    :type cl:float
    :initform 0.0)
   (end_lon
    :reader end_lon
    :initarg :end_lon
    :type cl:float
    :initform 0.0)
   (end_distance
    :reader end_distance
    :initarg :end_distance
    :type cl:float
    :initform 0.0))
)

(cl:defclass NavigateResult (<NavigateResult>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <NavigateResult>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'NavigateResult)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pt_actions-msg:<NavigateResult> is deprecated: use pt_actions-msg:NavigateResult instead.")))

(cl:ensure-generic-function 'end_lat-val :lambda-list '(m))
(cl:defmethod end_lat-val ((m <NavigateResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pt_actions-msg:end_lat-val is deprecated.  Use pt_actions-msg:end_lat instead.")
  (end_lat m))

(cl:ensure-generic-function 'end_lon-val :lambda-list '(m))
(cl:defmethod end_lon-val ((m <NavigateResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pt_actions-msg:end_lon-val is deprecated.  Use pt_actions-msg:end_lon instead.")
  (end_lon m))

(cl:ensure-generic-function 'end_distance-val :lambda-list '(m))
(cl:defmethod end_distance-val ((m <NavigateResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pt_actions-msg:end_distance-val is deprecated.  Use pt_actions-msg:end_distance instead.")
  (end_distance m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <NavigateResult>) ostream)
  "Serializes a message object of type '<NavigateResult>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'end_lat))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'end_lon))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'end_distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <NavigateResult>) istream)
  "Deserializes a message object of type '<NavigateResult>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'end_lat) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'end_lon) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'end_distance) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<NavigateResult>)))
  "Returns string type for a message object of type '<NavigateResult>"
  "pt_actions/NavigateResult")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'NavigateResult)))
  "Returns string type for a message object of type 'NavigateResult"
  "pt_actions/NavigateResult")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<NavigateResult>)))
  "Returns md5sum for a message object of type '<NavigateResult>"
  "271f7b861f12fb0f15fc6ac5f378f270")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'NavigateResult)))
  "Returns md5sum for a message object of type 'NavigateResult"
  "271f7b861f12fb0f15fc6ac5f378f270")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<NavigateResult>)))
  "Returns full string definition for message of type '<NavigateResult>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Define the result~%#The ending latitude and longitude on completion~%float64 end_lat~%float64 end_lon~%#The average(in metres) of how close the rover made it to the points~%float64 end_distance~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'NavigateResult)))
  "Returns full string definition for message of type 'NavigateResult"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Define the result~%#The ending latitude and longitude on completion~%float64 end_lat~%float64 end_lon~%#The average(in metres) of how close the rover made it to the points~%float64 end_distance~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <NavigateResult>))
  (cl:+ 0
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <NavigateResult>))
  "Converts a ROS message object to a list"
  (cl:list 'NavigateResult
    (cl:cons ':end_lat (end_lat msg))
    (cl:cons ':end_lon (end_lon msg))
    (cl:cons ':end_distance (end_distance msg))
))

; Auto-generated. Do not edit!


(cl:in-package pt_actions-msg)


;//! \htmlinclude NavigateFeedback.msg.html

(cl:defclass <NavigateFeedback> (roslisp-msg-protocol:ros-message)
  ((latitude
    :reader latitude
    :initarg :latitude
    :type cl:float
    :initform 0.0)
   (longitude
    :reader longitude
    :initarg :longitude
    :type cl:float
    :initform 0.0)
   (distanceTravelled
    :reader distanceTravelled
    :initarg :distanceTravelled
    :type cl:float
    :initform 0.0)
   (curPoint
    :reader curPoint
    :initarg :curPoint
    :type cl:fixnum
    :initform 0)
   (status
    :reader status
    :initarg :status
    :type cl:fixnum
    :initform 0))
)

(cl:defclass NavigateFeedback (<NavigateFeedback>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <NavigateFeedback>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'NavigateFeedback)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pt_actions-msg:<NavigateFeedback> is deprecated: use pt_actions-msg:NavigateFeedback instead.")))

(cl:ensure-generic-function 'latitude-val :lambda-list '(m))
(cl:defmethod latitude-val ((m <NavigateFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pt_actions-msg:latitude-val is deprecated.  Use pt_actions-msg:latitude instead.")
  (latitude m))

(cl:ensure-generic-function 'longitude-val :lambda-list '(m))
(cl:defmethod longitude-val ((m <NavigateFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pt_actions-msg:longitude-val is deprecated.  Use pt_actions-msg:longitude instead.")
  (longitude m))

(cl:ensure-generic-function 'distanceTravelled-val :lambda-list '(m))
(cl:defmethod distanceTravelled-val ((m <NavigateFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pt_actions-msg:distanceTravelled-val is deprecated.  Use pt_actions-msg:distanceTravelled instead.")
  (distanceTravelled m))

(cl:ensure-generic-function 'curPoint-val :lambda-list '(m))
(cl:defmethod curPoint-val ((m <NavigateFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pt_actions-msg:curPoint-val is deprecated.  Use pt_actions-msg:curPoint instead.")
  (curPoint m))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <NavigateFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pt_actions-msg:status-val is deprecated.  Use pt_actions-msg:status instead.")
  (status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <NavigateFeedback>) ostream)
  "Serializes a message object of type '<NavigateFeedback>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'latitude))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'longitude))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'distanceTravelled))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'curPoint)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <NavigateFeedback>) istream)
  "Deserializes a message object of type '<NavigateFeedback>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'latitude) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'longitude) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distanceTravelled) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'curPoint)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<NavigateFeedback>)))
  "Returns string type for a message object of type '<NavigateFeedback>"
  "pt_actions/NavigateFeedback")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'NavigateFeedback)))
  "Returns string type for a message object of type 'NavigateFeedback"
  "pt_actions/NavigateFeedback")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<NavigateFeedback>)))
  "Returns md5sum for a message object of type '<NavigateFeedback>"
  "472ed5bc364b6797971771f5605285cb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'NavigateFeedback)))
  "Returns md5sum for a message object of type 'NavigateFeedback"
  "472ed5bc364b6797971771f5605285cb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<NavigateFeedback>)))
  "Returns full string definition for message of type '<NavigateFeedback>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Define a feedback message~%#The current position of the rover~%float64 latitude~%float64 longitude~%~%#The total distance travelled~%float64 distanceTravelled~%~%#The current point on the path we are tracking from~%uint8 curPoint~%~%#The current status of the tracker. If 0, tracker is waiting for RTK lock~%#If 1, tracker has an RTK lock and is actively tracking path~%uint8 status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'NavigateFeedback)))
  "Returns full string definition for message of type 'NavigateFeedback"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Define a feedback message~%#The current position of the rover~%float64 latitude~%float64 longitude~%~%#The total distance travelled~%float64 distanceTravelled~%~%#The current point on the path we are tracking from~%uint8 curPoint~%~%#The current status of the tracker. If 0, tracker is waiting for RTK lock~%#If 1, tracker has an RTK lock and is actively tracking path~%uint8 status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <NavigateFeedback>))
  (cl:+ 0
     8
     8
     8
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <NavigateFeedback>))
  "Converts a ROS message object to a list"
  (cl:list 'NavigateFeedback
    (cl:cons ':latitude (latitude msg))
    (cl:cons ':longitude (longitude msg))
    (cl:cons ':distanceTravelled (distanceTravelled msg))
    (cl:cons ':curPoint (curPoint msg))
    (cl:cons ':status (status msg))
))

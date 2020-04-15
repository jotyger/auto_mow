; Auto-generated. Do not edit!


(cl:in-package pt_actions-msg)


;//! \htmlinclude NavigateGoal.msg.html

(cl:defclass <NavigateGoal> (roslisp-msg-protocol:ros-message)
  ((lats
    :reader lats
    :initarg :lats
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (lons
    :reader lons
    :initarg :lons
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (loops
    :reader loops
    :initarg :loops
    :type cl:fixnum
    :initform 0)
   (auto_size
    :reader auto_size
    :initarg :auto_size
    :type cl:float
    :initform 0.0)
   (lookahead_distance
    :reader lookahead_distance
    :initarg :lookahead_distance
    :type cl:float
    :initform 0.0)
   (max_angular_speed
    :reader max_angular_speed
    :initarg :max_angular_speed
    :type cl:float
    :initform 0.0)
   (threshold
    :reader threshold
    :initarg :threshold
    :type cl:float
    :initform 0.0)
   (desired_speed
    :reader desired_speed
    :initarg :desired_speed
    :type cl:float
    :initform 0.0)
   (start_point
    :reader start_point
    :initarg :start_point
    :type cl:fixnum
    :initform 0))
)

(cl:defclass NavigateGoal (<NavigateGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <NavigateGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'NavigateGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pt_actions-msg:<NavigateGoal> is deprecated: use pt_actions-msg:NavigateGoal instead.")))

(cl:ensure-generic-function 'lats-val :lambda-list '(m))
(cl:defmethod lats-val ((m <NavigateGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pt_actions-msg:lats-val is deprecated.  Use pt_actions-msg:lats instead.")
  (lats m))

(cl:ensure-generic-function 'lons-val :lambda-list '(m))
(cl:defmethod lons-val ((m <NavigateGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pt_actions-msg:lons-val is deprecated.  Use pt_actions-msg:lons instead.")
  (lons m))

(cl:ensure-generic-function 'loops-val :lambda-list '(m))
(cl:defmethod loops-val ((m <NavigateGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pt_actions-msg:loops-val is deprecated.  Use pt_actions-msg:loops instead.")
  (loops m))

(cl:ensure-generic-function 'auto_size-val :lambda-list '(m))
(cl:defmethod auto_size-val ((m <NavigateGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pt_actions-msg:auto_size-val is deprecated.  Use pt_actions-msg:auto_size instead.")
  (auto_size m))

(cl:ensure-generic-function 'lookahead_distance-val :lambda-list '(m))
(cl:defmethod lookahead_distance-val ((m <NavigateGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pt_actions-msg:lookahead_distance-val is deprecated.  Use pt_actions-msg:lookahead_distance instead.")
  (lookahead_distance m))

(cl:ensure-generic-function 'max_angular_speed-val :lambda-list '(m))
(cl:defmethod max_angular_speed-val ((m <NavigateGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pt_actions-msg:max_angular_speed-val is deprecated.  Use pt_actions-msg:max_angular_speed instead.")
  (max_angular_speed m))

(cl:ensure-generic-function 'threshold-val :lambda-list '(m))
(cl:defmethod threshold-val ((m <NavigateGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pt_actions-msg:threshold-val is deprecated.  Use pt_actions-msg:threshold instead.")
  (threshold m))

(cl:ensure-generic-function 'desired_speed-val :lambda-list '(m))
(cl:defmethod desired_speed-val ((m <NavigateGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pt_actions-msg:desired_speed-val is deprecated.  Use pt_actions-msg:desired_speed instead.")
  (desired_speed m))

(cl:ensure-generic-function 'start_point-val :lambda-list '(m))
(cl:defmethod start_point-val ((m <NavigateGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pt_actions-msg:start_point-val is deprecated.  Use pt_actions-msg:start_point instead.")
  (start_point m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <NavigateGoal>) ostream)
  "Serializes a message object of type '<NavigateGoal>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'lats))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'lats))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'lons))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'lons))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'loops)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'auto_size))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'lookahead_distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'max_angular_speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'threshold))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'desired_speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'start_point)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <NavigateGoal>) istream)
  "Deserializes a message object of type '<NavigateGoal>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'lats) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'lats)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'lons) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'lons)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'loops)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'auto_size) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'lookahead_distance) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'max_angular_speed) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'threshold) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'desired_speed) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'start_point)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<NavigateGoal>)))
  "Returns string type for a message object of type '<NavigateGoal>"
  "pt_actions/NavigateGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'NavigateGoal)))
  "Returns string type for a message object of type 'NavigateGoal"
  "pt_actions/NavigateGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<NavigateGoal>)))
  "Returns md5sum for a message object of type '<NavigateGoal>"
  "a6de8548f9f5a7b985ca39ba834dfdb4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'NavigateGoal)))
  "Returns md5sum for a message object of type 'NavigateGoal"
  "a6de8548f9f5a7b985ca39ba834dfdb4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<NavigateGoal>)))
  "Returns full string definition for message of type '<NavigateGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Define the Goal~%#The latitudes and longitudes of the points to travel to.~%#Starting location is at index 0, First point~%#to travel to is at index 1 ~%float64[] lats~%float64[] lons ~%#The number of loops to do around the points~%uint8 loops ~%~%#The square size for auto generating points~%float64 auto_size~%~%#The lookahead distance for the~%#Pure Pursuit Controller. higher values~%#cause the rover to converge to path more~%#slowly~%float64 lookahead_distance~%float64 max_angular_speed~%float64 threshold~%#The desired speed to drive along~%#the path~%float64 desired_speed~%~%#The start point index in the path~%uint8 start_point~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'NavigateGoal)))
  "Returns full string definition for message of type 'NavigateGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Define the Goal~%#The latitudes and longitudes of the points to travel to.~%#Starting location is at index 0, First point~%#to travel to is at index 1 ~%float64[] lats~%float64[] lons ~%#The number of loops to do around the points~%uint8 loops ~%~%#The square size for auto generating points~%float64 auto_size~%~%#The lookahead distance for the~%#Pure Pursuit Controller. higher values~%#cause the rover to converge to path more~%#slowly~%float64 lookahead_distance~%float64 max_angular_speed~%float64 threshold~%#The desired speed to drive along~%#the path~%float64 desired_speed~%~%#The start point index in the path~%uint8 start_point~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <NavigateGoal>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'lats) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'lons) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     1
     8
     8
     8
     8
     8
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <NavigateGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'NavigateGoal
    (cl:cons ':lats (lats msg))
    (cl:cons ':lons (lons msg))
    (cl:cons ':loops (loops msg))
    (cl:cons ':auto_size (auto_size msg))
    (cl:cons ':lookahead_distance (lookahead_distance msg))
    (cl:cons ':max_angular_speed (max_angular_speed msg))
    (cl:cons ':threshold (threshold msg))
    (cl:cons ':desired_speed (desired_speed msg))
    (cl:cons ':start_point (start_point msg))
))

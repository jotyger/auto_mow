;; Auto-generated. Do not edit!


(when (boundp 'kdl_msgs::TwistStamped)
  (if (not (find-package "KDL_MSGS"))
    (make-package "KDL_MSGS"))
  (shadow 'TwistStamped (find-package "KDL_MSGS")))
(unless (find-package "KDL_MSGS::TWISTSTAMPED")
  (make-package "KDL_MSGS::TWISTSTAMPED"))

(in-package "ROS")
;;//! \htmlinclude TwistStamped.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass kdl_msgs::TwistStamped
  :super ros::object
  :slots (_header _twist ))

(defmethod kdl_msgs::TwistStamped
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:twist __twist) (instance kdl_msgs::Twist :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _twist __twist)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:twist
   (&rest __twist)
   (if (keywordp (car __twist))
       (send* _twist __twist)
     (progn
       (if __twist (setq _twist (car __twist)))
       _twist)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; kdl_msgs/Twist _twist
    (send _twist :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; kdl_msgs/Twist _twist
       (send _twist :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; kdl_msgs/Twist _twist
     (send _twist :deserialize buf ptr-) (incf ptr- (send _twist :serialization-length))
   ;;
   self)
  )

(setf (get kdl_msgs::TwistStamped :md5sum-) "98d34b0043a2093cf9d9345ab6eef12e")
(setf (get kdl_msgs::TwistStamped :datatype-) "kdl_msgs/TwistStamped")
(setf (get kdl_msgs::TwistStamped :definition-)
      "# Represents a stamped KDL::Twist instance.
# This message is compatible to geometry_msgs/TwistStamped.

Header header
Twist twist

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: kdl_msgs/Twist
# Represents a KDL::Twist instance.
# This message is compatible to geometry_msgs/Twist.

Vector linear
Vector angular

================================================================================
MSG: kdl_msgs/Vector
# Represents a KDL::Vector instance.
# This message is compatible to geometry_msgs/Vector3.

float64 x
float64 y
float64 z

")



(provide :kdl_msgs/TwistStamped "98d34b0043a2093cf9d9345ab6eef12e")



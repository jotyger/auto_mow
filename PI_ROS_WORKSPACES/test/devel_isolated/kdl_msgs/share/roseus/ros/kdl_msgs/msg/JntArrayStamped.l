;; Auto-generated. Do not edit!


(when (boundp 'kdl_msgs::JntArrayStamped)
  (if (not (find-package "KDL_MSGS"))
    (make-package "KDL_MSGS"))
  (shadow 'JntArrayStamped (find-package "KDL_MSGS")))
(unless (find-package "KDL_MSGS::JNTARRAYSTAMPED")
  (make-package "KDL_MSGS::JNTARRAYSTAMPED"))

(in-package "ROS")
;;//! \htmlinclude JntArrayStamped.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass kdl_msgs::JntArrayStamped
  :super ros::object
  :slots (_header _joints ))

(defmethod kdl_msgs::JntArrayStamped
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:joints __joints) (instance kdl_msgs::JntArray :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _joints __joints)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:joints
   (&rest __joints)
   (if (keywordp (car __joints))
       (send* _joints __joints)
     (progn
       (if __joints (setq _joints (car __joints)))
       _joints)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; kdl_msgs/JntArray _joints
    (send _joints :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; kdl_msgs/JntArray _joints
       (send _joints :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; kdl_msgs/JntArray _joints
     (send _joints :deserialize buf ptr-) (incf ptr- (send _joints :serialization-length))
   ;;
   self)
  )

(setf (get kdl_msgs::JntArrayStamped :md5sum-) "bc6436c1eca974e807d4ae33aab49725")
(setf (get kdl_msgs::JntArrayStamped :datatype-) "kdl_msgs/JntArrayStamped")
(setf (get kdl_msgs::JntArrayStamped :definition-)
      "# Represents a stamped KDL::JntArray instance.

Header header
JntArray joints

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
MSG: kdl_msgs/JntArray
# Represents a KDL::JntArray instance.

float64[] data

")



(provide :kdl_msgs/JntArrayStamped "bc6436c1eca974e807d4ae33aab49725")



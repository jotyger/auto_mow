;; Auto-generated. Do not edit!


(when (boundp 'kdl_msgs::FrameStamped)
  (if (not (find-package "KDL_MSGS"))
    (make-package "KDL_MSGS"))
  (shadow 'FrameStamped (find-package "KDL_MSGS")))
(unless (find-package "KDL_MSGS::FRAMESTAMPED")
  (make-package "KDL_MSGS::FRAMESTAMPED"))

(in-package "ROS")
;;//! \htmlinclude FrameStamped.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass kdl_msgs::FrameStamped
  :super ros::object
  :slots (_header _frame ))

(defmethod kdl_msgs::FrameStamped
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:frame __frame) (instance kdl_msgs::Frame :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _frame __frame)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:frame
   (&rest __frame)
   (if (keywordp (car __frame))
       (send* _frame __frame)
     (progn
       (if __frame (setq _frame (car __frame)))
       _frame)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; kdl_msgs/Frame _frame
    (send _frame :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; kdl_msgs/Frame _frame
       (send _frame :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; kdl_msgs/Frame _frame
     (send _frame :deserialize buf ptr-) (incf ptr- (send _frame :serialization-length))
   ;;
   self)
  )

(setf (get kdl_msgs::FrameStamped :md5sum-) "44e83f9a1d6f6e367ebd23d6403853f1")
(setf (get kdl_msgs::FrameStamped :datatype-) "kdl_msgs/FrameStamped")
(setf (get kdl_msgs::FrameStamped :definition-)
      "# Represents a stamped KDL::Frame instance.

Header header
Frame frame

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
MSG: kdl_msgs/Frame
# Represents a KDL::Frame instance.

Vector p
Rotation M

================================================================================
MSG: kdl_msgs/Vector
# Represents a KDL::Vector instance.
# This message is compatible to geometry_msgs/Vector3.

float64 x
float64 y
float64 z

================================================================================
MSG: kdl_msgs/Rotation
# Represents a KDL::Rotation instance.

float64[9] data

")



(provide :kdl_msgs/FrameStamped "44e83f9a1d6f6e367ebd23d6403853f1")



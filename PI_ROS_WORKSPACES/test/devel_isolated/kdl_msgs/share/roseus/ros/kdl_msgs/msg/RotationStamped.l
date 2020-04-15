;; Auto-generated. Do not edit!


(when (boundp 'kdl_msgs::RotationStamped)
  (if (not (find-package "KDL_MSGS"))
    (make-package "KDL_MSGS"))
  (shadow 'RotationStamped (find-package "KDL_MSGS")))
(unless (find-package "KDL_MSGS::ROTATIONSTAMPED")
  (make-package "KDL_MSGS::ROTATIONSTAMPED"))

(in-package "ROS")
;;//! \htmlinclude RotationStamped.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass kdl_msgs::RotationStamped
  :super ros::object
  :slots (_header _rotation ))

(defmethod kdl_msgs::RotationStamped
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:rotation __rotation) (instance kdl_msgs::Rotation :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _rotation __rotation)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:rotation
   (&rest __rotation)
   (if (keywordp (car __rotation))
       (send* _rotation __rotation)
     (progn
       (if __rotation (setq _rotation (car __rotation)))
       _rotation)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; kdl_msgs/Rotation _rotation
    (send _rotation :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; kdl_msgs/Rotation _rotation
       (send _rotation :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; kdl_msgs/Rotation _rotation
     (send _rotation :deserialize buf ptr-) (incf ptr- (send _rotation :serialization-length))
   ;;
   self)
  )

(setf (get kdl_msgs::RotationStamped :md5sum-) "f0314fdaba929afcefc0f8476c959fec")
(setf (get kdl_msgs::RotationStamped :datatype-) "kdl_msgs/RotationStamped")
(setf (get kdl_msgs::RotationStamped :definition-)
      "# Represents a stamped KDL::Rotation instance.

Header header
Rotation rotation

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
MSG: kdl_msgs/Rotation
# Represents a KDL::Rotation instance.

float64[9] data

")



(provide :kdl_msgs/RotationStamped "f0314fdaba929afcefc0f8476c959fec")



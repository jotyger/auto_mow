;; Auto-generated. Do not edit!


(when (boundp 'kdl_msgs::VectorStamped)
  (if (not (find-package "KDL_MSGS"))
    (make-package "KDL_MSGS"))
  (shadow 'VectorStamped (find-package "KDL_MSGS")))
(unless (find-package "KDL_MSGS::VECTORSTAMPED")
  (make-package "KDL_MSGS::VECTORSTAMPED"))

(in-package "ROS")
;;//! \htmlinclude VectorStamped.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass kdl_msgs::VectorStamped
  :super ros::object
  :slots (_header _vector ))

(defmethod kdl_msgs::VectorStamped
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:vector __vector) (instance kdl_msgs::Vector :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _vector __vector)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:vector
   (&rest __vector)
   (if (keywordp (car __vector))
       (send* _vector __vector)
     (progn
       (if __vector (setq _vector (car __vector)))
       _vector)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; kdl_msgs/Vector _vector
    (send _vector :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; kdl_msgs/Vector _vector
       (send _vector :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; kdl_msgs/Vector _vector
     (send _vector :deserialize buf ptr-) (incf ptr- (send _vector :serialization-length))
   ;;
   self)
  )

(setf (get kdl_msgs::VectorStamped :md5sum-) "7b324c7325e683bf02a9b14b01090ec7")
(setf (get kdl_msgs::VectorStamped :datatype-) "kdl_msgs/VectorStamped")
(setf (get kdl_msgs::VectorStamped :definition-)
      "# Represents a stamped KDL::Vector instance.
# This message is compatible to geometry_msgs/Vector3Stamped.

Header header
Vector vector

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
MSG: kdl_msgs/Vector
# Represents a KDL::Vector instance.
# This message is compatible to geometry_msgs/Vector3.

float64 x
float64 y
float64 z

")



(provide :kdl_msgs/VectorStamped "7b324c7325e683bf02a9b14b01090ec7")



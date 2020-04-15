;; Auto-generated. Do not edit!


(when (boundp 'kdl_msgs::Frame)
  (if (not (find-package "KDL_MSGS"))
    (make-package "KDL_MSGS"))
  (shadow 'Frame (find-package "KDL_MSGS")))
(unless (find-package "KDL_MSGS::FRAME")
  (make-package "KDL_MSGS::FRAME"))

(in-package "ROS")
;;//! \htmlinclude Frame.msg.html


(defclass kdl_msgs::Frame
  :super ros::object
  :slots (_p _M ))

(defmethod kdl_msgs::Frame
  (:init
   (&key
    ((:p __p) (instance kdl_msgs::Vector :init))
    ((:M __M) (instance kdl_msgs::Rotation :init))
    )
   (send-super :init)
   (setq _p __p)
   (setq _M __M)
   self)
  (:p
   (&rest __p)
   (if (keywordp (car __p))
       (send* _p __p)
     (progn
       (if __p (setq _p (car __p)))
       _p)))
  (:M
   (&rest __M)
   (if (keywordp (car __M))
       (send* _M __M)
     (progn
       (if __M (setq _M (car __M)))
       _M)))
  (:serialization-length
   ()
   (+
    ;; kdl_msgs/Vector _p
    (send _p :serialization-length)
    ;; kdl_msgs/Rotation _M
    (send _M :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; kdl_msgs/Vector _p
       (send _p :serialize s)
     ;; kdl_msgs/Rotation _M
       (send _M :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; kdl_msgs/Vector _p
     (send _p :deserialize buf ptr-) (incf ptr- (send _p :serialization-length))
   ;; kdl_msgs/Rotation _M
     (send _M :deserialize buf ptr-) (incf ptr- (send _M :serialization-length))
   ;;
   self)
  )

(setf (get kdl_msgs::Frame :md5sum-) "8fafbf9f5543db8a3b54001d19dc815d")
(setf (get kdl_msgs::Frame :datatype-) "kdl_msgs/Frame")
(setf (get kdl_msgs::Frame :definition-)
      "# Represents a KDL::Frame instance.

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



(provide :kdl_msgs/Frame "8fafbf9f5543db8a3b54001d19dc815d")



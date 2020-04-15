;; Auto-generated. Do not edit!


(when (boundp 'kdl_msgs::Twist)
  (if (not (find-package "KDL_MSGS"))
    (make-package "KDL_MSGS"))
  (shadow 'Twist (find-package "KDL_MSGS")))
(unless (find-package "KDL_MSGS::TWIST")
  (make-package "KDL_MSGS::TWIST"))

(in-package "ROS")
;;//! \htmlinclude Twist.msg.html


(defclass kdl_msgs::Twist
  :super ros::object
  :slots (_linear _angular ))

(defmethod kdl_msgs::Twist
  (:init
   (&key
    ((:linear __linear) (instance kdl_msgs::Vector :init))
    ((:angular __angular) (instance kdl_msgs::Vector :init))
    )
   (send-super :init)
   (setq _linear __linear)
   (setq _angular __angular)
   self)
  (:linear
   (&rest __linear)
   (if (keywordp (car __linear))
       (send* _linear __linear)
     (progn
       (if __linear (setq _linear (car __linear)))
       _linear)))
  (:angular
   (&rest __angular)
   (if (keywordp (car __angular))
       (send* _angular __angular)
     (progn
       (if __angular (setq _angular (car __angular)))
       _angular)))
  (:serialization-length
   ()
   (+
    ;; kdl_msgs/Vector _linear
    (send _linear :serialization-length)
    ;; kdl_msgs/Vector _angular
    (send _angular :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; kdl_msgs/Vector _linear
       (send _linear :serialize s)
     ;; kdl_msgs/Vector _angular
       (send _angular :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; kdl_msgs/Vector _linear
     (send _linear :deserialize buf ptr-) (incf ptr- (send _linear :serialization-length))
   ;; kdl_msgs/Vector _angular
     (send _angular :deserialize buf ptr-) (incf ptr- (send _angular :serialization-length))
   ;;
   self)
  )

(setf (get kdl_msgs::Twist :md5sum-) "9f195f881246fdfa2798d1d3eebca84a")
(setf (get kdl_msgs::Twist :datatype-) "kdl_msgs/Twist")
(setf (get kdl_msgs::Twist :definition-)
      "# Represents a KDL::Twist instance.
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



(provide :kdl_msgs/Twist "9f195f881246fdfa2798d1d3eebca84a")



;; Auto-generated. Do not edit!


(when (boundp 'kdl_msgs::Wrench)
  (if (not (find-package "KDL_MSGS"))
    (make-package "KDL_MSGS"))
  (shadow 'Wrench (find-package "KDL_MSGS")))
(unless (find-package "KDL_MSGS::WRENCH")
  (make-package "KDL_MSGS::WRENCH"))

(in-package "ROS")
;;//! \htmlinclude Wrench.msg.html


(defclass kdl_msgs::Wrench
  :super ros::object
  :slots (_force _torque ))

(defmethod kdl_msgs::Wrench
  (:init
   (&key
    ((:force __force) (instance kdl_msgs::Vector :init))
    ((:torque __torque) (instance kdl_msgs::Vector :init))
    )
   (send-super :init)
   (setq _force __force)
   (setq _torque __torque)
   self)
  (:force
   (&rest __force)
   (if (keywordp (car __force))
       (send* _force __force)
     (progn
       (if __force (setq _force (car __force)))
       _force)))
  (:torque
   (&rest __torque)
   (if (keywordp (car __torque))
       (send* _torque __torque)
     (progn
       (if __torque (setq _torque (car __torque)))
       _torque)))
  (:serialization-length
   ()
   (+
    ;; kdl_msgs/Vector _force
    (send _force :serialization-length)
    ;; kdl_msgs/Vector _torque
    (send _torque :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; kdl_msgs/Vector _force
       (send _force :serialize s)
     ;; kdl_msgs/Vector _torque
       (send _torque :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; kdl_msgs/Vector _force
     (send _force :deserialize buf ptr-) (incf ptr- (send _force :serialization-length))
   ;; kdl_msgs/Vector _torque
     (send _torque :deserialize buf ptr-) (incf ptr- (send _torque :serialization-length))
   ;;
   self)
  )

(setf (get kdl_msgs::Wrench :md5sum-) "4f539cf138b23283b520fd271b567936")
(setf (get kdl_msgs::Wrench :datatype-) "kdl_msgs/Wrench")
(setf (get kdl_msgs::Wrench :definition-)
      "# Represents a KDL::Wrench instance.
# This message is compatible to geometry_msgs/Wrench.

Vector force
Vector torque

================================================================================
MSG: kdl_msgs/Vector
# Represents a KDL::Vector instance.
# This message is compatible to geometry_msgs/Vector3.

float64 x
float64 y
float64 z

")



(provide :kdl_msgs/Wrench "4f539cf138b23283b520fd271b567936")



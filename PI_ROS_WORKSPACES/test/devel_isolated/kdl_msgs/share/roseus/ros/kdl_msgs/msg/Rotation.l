;; Auto-generated. Do not edit!


(when (boundp 'kdl_msgs::Rotation)
  (if (not (find-package "KDL_MSGS"))
    (make-package "KDL_MSGS"))
  (shadow 'Rotation (find-package "KDL_MSGS")))
(unless (find-package "KDL_MSGS::ROTATION")
  (make-package "KDL_MSGS::ROTATION"))

(in-package "ROS")
;;//! \htmlinclude Rotation.msg.html


(defclass kdl_msgs::Rotation
  :super ros::object
  :slots (_data ))

(defmethod kdl_msgs::Rotation
  (:init
   (&key
    ((:data __data) (make-array 9 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _data __data)
   self)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; float64[9] _data
    (* 8    9)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[9] _data
     (dotimes (i 9)
       (sys::poke (elt _data i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[9] _data
   (dotimes (i (length _data))
     (setf (elt _data i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;;
   self)
  )

(setf (get kdl_msgs::Rotation :md5sum-) "ca66b32e4ad9de837a30ea9fe5ade752")
(setf (get kdl_msgs::Rotation :datatype-) "kdl_msgs/Rotation")
(setf (get kdl_msgs::Rotation :definition-)
      "# Represents a KDL::Rotation instance.

float64[9] data

")



(provide :kdl_msgs/Rotation "ca66b32e4ad9de837a30ea9fe5ade752")



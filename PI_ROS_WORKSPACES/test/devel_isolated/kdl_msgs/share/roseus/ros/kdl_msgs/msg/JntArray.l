;; Auto-generated. Do not edit!


(when (boundp 'kdl_msgs::JntArray)
  (if (not (find-package "KDL_MSGS"))
    (make-package "KDL_MSGS"))
  (shadow 'JntArray (find-package "KDL_MSGS")))
(unless (find-package "KDL_MSGS::JNTARRAY")
  (make-package "KDL_MSGS::JNTARRAY"))

(in-package "ROS")
;;//! \htmlinclude JntArray.msg.html


(defclass kdl_msgs::JntArray
  :super ros::object
  :slots (_data ))

(defmethod kdl_msgs::JntArray
  (:init
   (&key
    ((:data __data) (make-array 0 :initial-element 0.0 :element-type :float))
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
    ;; float64[] _data
    (* 8    (length _data)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _data
     (write-long (length _data) s)
     (dotimes (i (length _data))
       (sys::poke (elt _data i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _data (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _data i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(setf (get kdl_msgs::JntArray :md5sum-) "788898178a3da2c3718461eecda8f714")
(setf (get kdl_msgs::JntArray :datatype-) "kdl_msgs/JntArray")
(setf (get kdl_msgs::JntArray :definition-)
      "# Represents a KDL::JntArray instance.

float64[] data

")



(provide :kdl_msgs/JntArray "788898178a3da2c3718461eecda8f714")



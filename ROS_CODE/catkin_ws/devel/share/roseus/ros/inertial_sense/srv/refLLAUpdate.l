;; Auto-generated. Do not edit!


(when (boundp 'inertial_sense::refLLAUpdate)
  (if (not (find-package "INERTIAL_SENSE"))
    (make-package "INERTIAL_SENSE"))
  (shadow 'refLLAUpdate (find-package "INERTIAL_SENSE")))
(unless (find-package "INERTIAL_SENSE::REFLLAUPDATE")
  (make-package "INERTIAL_SENSE::REFLLAUPDATE"))
(unless (find-package "INERTIAL_SENSE::REFLLAUPDATEREQUEST")
  (make-package "INERTIAL_SENSE::REFLLAUPDATEREQUEST"))
(unless (find-package "INERTIAL_SENSE::REFLLAUPDATERESPONSE")
  (make-package "INERTIAL_SENSE::REFLLAUPDATERESPONSE"))

(in-package "ROS")





(defclass inertial_sense::refLLAUpdateRequest
  :super ros::object
  :slots (_lla ))

(defmethod inertial_sense::refLLAUpdateRequest
  (:init
   (&key
    ((:lla __lla) (make-array 3 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _lla __lla)
   self)
  (:lla
   (&optional __lla)
   (if __lla (setq _lla __lla)) _lla)
  (:serialization-length
   ()
   (+
    ;; float64[3] _lla
    (* 8    3)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[3] _lla
     (dotimes (i 3)
       (sys::poke (elt _lla i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[3] _lla
   (dotimes (i (length _lla))
     (setf (elt _lla i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;;
   self)
  )

(defclass inertial_sense::refLLAUpdateResponse
  :super ros::object
  :slots (_success ))

(defmethod inertial_sense::refLLAUpdateResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass inertial_sense::refLLAUpdate
  :super ros::object
  :slots ())

(setf (get inertial_sense::refLLAUpdate :md5sum-) "5a918f5427bcbd7ecd160c9b61300277")
(setf (get inertial_sense::refLLAUpdate :datatype-) "inertial_sense/refLLAUpdate")
(setf (get inertial_sense::refLLAUpdate :request) inertial_sense::refLLAUpdateRequest)
(setf (get inertial_sense::refLLAUpdate :response) inertial_sense::refLLAUpdateResponse)

(defmethod inertial_sense::refLLAUpdateRequest
  (:response () (instance inertial_sense::refLLAUpdateResponse :init)))

(setf (get inertial_sense::refLLAUpdateRequest :md5sum-) "5a918f5427bcbd7ecd160c9b61300277")
(setf (get inertial_sense::refLLAUpdateRequest :datatype-) "inertial_sense/refLLAUpdateRequest")
(setf (get inertial_sense::refLLAUpdateRequest :definition-)
      "float64[3] lla
---
bool success
")

(setf (get inertial_sense::refLLAUpdateResponse :md5sum-) "5a918f5427bcbd7ecd160c9b61300277")
(setf (get inertial_sense::refLLAUpdateResponse :datatype-) "inertial_sense/refLLAUpdateResponse")
(setf (get inertial_sense::refLLAUpdateResponse :definition-)
      "float64[3] lla
---
bool success
")



(provide :inertial_sense/refLLAUpdate "5a918f5427bcbd7ecd160c9b61300277")



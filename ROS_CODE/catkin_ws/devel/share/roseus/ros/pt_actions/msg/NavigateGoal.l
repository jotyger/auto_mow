;; Auto-generated. Do not edit!


(when (boundp 'pt_actions::NavigateGoal)
  (if (not (find-package "PT_ACTIONS"))
    (make-package "PT_ACTIONS"))
  (shadow 'NavigateGoal (find-package "PT_ACTIONS")))
(unless (find-package "PT_ACTIONS::NAVIGATEGOAL")
  (make-package "PT_ACTIONS::NAVIGATEGOAL"))

(in-package "ROS")
;;//! \htmlinclude NavigateGoal.msg.html


(defclass pt_actions::NavigateGoal
  :super ros::object
  :slots (_lats _lons _loops _auto_size _lookahead_distance _max_angular_speed _threshold _desired_speed _start_point ))

(defmethod pt_actions::NavigateGoal
  (:init
   (&key
    ((:lats __lats) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:lons __lons) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:loops __loops) 0)
    ((:auto_size __auto_size) 0.0)
    ((:lookahead_distance __lookahead_distance) 0.0)
    ((:max_angular_speed __max_angular_speed) 0.0)
    ((:threshold __threshold) 0.0)
    ((:desired_speed __desired_speed) 0.0)
    ((:start_point __start_point) 0)
    )
   (send-super :init)
   (setq _lats __lats)
   (setq _lons __lons)
   (setq _loops (round __loops))
   (setq _auto_size (float __auto_size))
   (setq _lookahead_distance (float __lookahead_distance))
   (setq _max_angular_speed (float __max_angular_speed))
   (setq _threshold (float __threshold))
   (setq _desired_speed (float __desired_speed))
   (setq _start_point (round __start_point))
   self)
  (:lats
   (&optional __lats)
   (if __lats (setq _lats __lats)) _lats)
  (:lons
   (&optional __lons)
   (if __lons (setq _lons __lons)) _lons)
  (:loops
   (&optional __loops)
   (if __loops (setq _loops __loops)) _loops)
  (:auto_size
   (&optional __auto_size)
   (if __auto_size (setq _auto_size __auto_size)) _auto_size)
  (:lookahead_distance
   (&optional __lookahead_distance)
   (if __lookahead_distance (setq _lookahead_distance __lookahead_distance)) _lookahead_distance)
  (:max_angular_speed
   (&optional __max_angular_speed)
   (if __max_angular_speed (setq _max_angular_speed __max_angular_speed)) _max_angular_speed)
  (:threshold
   (&optional __threshold)
   (if __threshold (setq _threshold __threshold)) _threshold)
  (:desired_speed
   (&optional __desired_speed)
   (if __desired_speed (setq _desired_speed __desired_speed)) _desired_speed)
  (:start_point
   (&optional __start_point)
   (if __start_point (setq _start_point __start_point)) _start_point)
  (:serialization-length
   ()
   (+
    ;; float64[] _lats
    (* 8    (length _lats)) 4
    ;; float64[] _lons
    (* 8    (length _lons)) 4
    ;; uint8 _loops
    1
    ;; float64 _auto_size
    8
    ;; float64 _lookahead_distance
    8
    ;; float64 _max_angular_speed
    8
    ;; float64 _threshold
    8
    ;; float64 _desired_speed
    8
    ;; uint8 _start_point
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _lats
     (write-long (length _lats) s)
     (dotimes (i (length _lats))
       (sys::poke (elt _lats i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _lons
     (write-long (length _lons) s)
     (dotimes (i (length _lons))
       (sys::poke (elt _lons i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; uint8 _loops
       (write-byte _loops s)
     ;; float64 _auto_size
       (sys::poke _auto_size (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _lookahead_distance
       (sys::poke _lookahead_distance (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _max_angular_speed
       (sys::poke _max_angular_speed (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _threshold
       (sys::poke _threshold (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _desired_speed
       (sys::poke _desired_speed (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; uint8 _start_point
       (write-byte _start_point s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _lats
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _lats (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _lats i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _lons
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _lons (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _lons i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; uint8 _loops
     (setq _loops (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float64 _auto_size
     (setq _auto_size (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _lookahead_distance
     (setq _lookahead_distance (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _max_angular_speed
     (setq _max_angular_speed (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _threshold
     (setq _threshold (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _desired_speed
     (setq _desired_speed (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; uint8 _start_point
     (setq _start_point (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get pt_actions::NavigateGoal :md5sum-) "a6de8548f9f5a7b985ca39ba834dfdb4")
(setf (get pt_actions::NavigateGoal :datatype-) "pt_actions/NavigateGoal")
(setf (get pt_actions::NavigateGoal :definition-)
      "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
# Define the Goal
#The latitudes and longitudes of the points to travel to.
#Starting location is at index 0, First point
#to travel to is at index 1 
float64[] lats
float64[] lons 
#The number of loops to do around the points
uint8 loops 

#The square size for auto generating points
float64 auto_size

#The lookahead distance for the
#Pure Pursuit Controller. higher values
#cause the rover to converge to path more
#slowly
float64 lookahead_distance
float64 max_angular_speed
float64 threshold
#The desired speed to drive along
#the path
float64 desired_speed

#The start point index in the path
uint8 start_point

")



(provide :pt_actions/NavigateGoal "a6de8548f9f5a7b985ca39ba834dfdb4")



// Generated by gencpp from file pt_actions/NavigateActionGoal.msg
// DO NOT EDIT!


#ifndef PT_ACTIONS_MESSAGE_NAVIGATEACTIONGOAL_H
#define PT_ACTIONS_MESSAGE_NAVIGATEACTIONGOAL_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <actionlib_msgs/GoalID.h>
#include <pt_actions/NavigateGoal.h>

namespace pt_actions
{
template <class ContainerAllocator>
struct NavigateActionGoal_
{
  typedef NavigateActionGoal_<ContainerAllocator> Type;

  NavigateActionGoal_()
    : header()
    , goal_id()
    , goal()  {
    }
  NavigateActionGoal_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , goal_id(_alloc)
    , goal(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef  ::actionlib_msgs::GoalID_<ContainerAllocator>  _goal_id_type;
  _goal_id_type goal_id;

   typedef  ::pt_actions::NavigateGoal_<ContainerAllocator>  _goal_type;
  _goal_type goal;





  typedef boost::shared_ptr< ::pt_actions::NavigateActionGoal_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::pt_actions::NavigateActionGoal_<ContainerAllocator> const> ConstPtr;

}; // struct NavigateActionGoal_

typedef ::pt_actions::NavigateActionGoal_<std::allocator<void> > NavigateActionGoal;

typedef boost::shared_ptr< ::pt_actions::NavigateActionGoal > NavigateActionGoalPtr;
typedef boost::shared_ptr< ::pt_actions::NavigateActionGoal const> NavigateActionGoalConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::pt_actions::NavigateActionGoal_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::pt_actions::NavigateActionGoal_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace pt_actions

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': True}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg'], 'pt_actions': ['/home/ubuntu/catkin_ws/devel/share/pt_actions/msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'actionlib_msgs': ['/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::pt_actions::NavigateActionGoal_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::pt_actions::NavigateActionGoal_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::pt_actions::NavigateActionGoal_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::pt_actions::NavigateActionGoal_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::pt_actions::NavigateActionGoal_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::pt_actions::NavigateActionGoal_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::pt_actions::NavigateActionGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "543023e0b3e5f2b0ce34ca181ccefe16";
  }

  static const char* value(const ::pt_actions::NavigateActionGoal_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x543023e0b3e5f2b0ULL;
  static const uint64_t static_value2 = 0xce34ca181ccefe16ULL;
};

template<class ContainerAllocator>
struct DataType< ::pt_actions::NavigateActionGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "pt_actions/NavigateActionGoal";
  }

  static const char* value(const ::pt_actions::NavigateActionGoal_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::pt_actions::NavigateActionGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n\
\n\
Header header\n\
actionlib_msgs/GoalID goal_id\n\
NavigateGoal goal\n\
\n\
================================================================================\n\
MSG: std_msgs/Header\n\
# Standard metadata for higher-level stamped data types.\n\
# This is generally used to communicate timestamped data \n\
# in a particular coordinate frame.\n\
# \n\
# sequence ID: consecutively increasing ID \n\
uint32 seq\n\
#Two-integer timestamp that is expressed as:\n\
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n\
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n\
# time-handling sugar is provided by the client library\n\
time stamp\n\
#Frame this data is associated with\n\
# 0: no frame\n\
# 1: global frame\n\
string frame_id\n\
\n\
================================================================================\n\
MSG: actionlib_msgs/GoalID\n\
# The stamp should store the time at which this goal was requested.\n\
# It is used by an action server when it tries to preempt all\n\
# goals that were requested before a certain time\n\
time stamp\n\
\n\
# The id provides a way to associate feedback and\n\
# result message with specific goal requests. The id\n\
# specified must be unique.\n\
string id\n\
\n\
\n\
================================================================================\n\
MSG: pt_actions/NavigateGoal\n\
# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n\
# Define the Goal\n\
#The latitudes and longitudes of the points to travel to.\n\
#Starting location is at index 0, First point\n\
#to travel to is at index 1 \n\
float64[] lats\n\
float64[] lons \n\
#The number of loops to do around the points\n\
uint8 loops \n\
\n\
#The square size for auto generating points\n\
float64 auto_size\n\
\n\
#The lookahead distance for the\n\
#Pure Pursuit Controller. higher values\n\
#cause the rover to converge to path more\n\
#slowly\n\
float64 lookahead_distance\n\
float64 max_angular_speed\n\
float64 threshold\n\
#The desired speed to drive along\n\
#the path\n\
float64 desired_speed\n\
\n\
#The start point index in the path\n\
uint8 start_point\n\
";
  }

  static const char* value(const ::pt_actions::NavigateActionGoal_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::pt_actions::NavigateActionGoal_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.goal_id);
      stream.next(m.goal);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct NavigateActionGoal_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::pt_actions::NavigateActionGoal_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::pt_actions::NavigateActionGoal_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "goal_id: ";
    s << std::endl;
    Printer< ::actionlib_msgs::GoalID_<ContainerAllocator> >::stream(s, indent + "  ", v.goal_id);
    s << indent << "goal: ";
    s << std::endl;
    Printer< ::pt_actions::NavigateGoal_<ContainerAllocator> >::stream(s, indent + "  ", v.goal);
  }
};

} // namespace message_operations
} // namespace ros

#endif // PT_ACTIONS_MESSAGE_NAVIGATEACTIONGOAL_H

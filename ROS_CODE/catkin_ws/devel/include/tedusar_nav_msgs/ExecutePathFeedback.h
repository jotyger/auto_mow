// Generated by gencpp from file tedusar_nav_msgs/ExecutePathFeedback.msg
// DO NOT EDIT!


#ifndef TEDUSAR_NAV_MSGS_MESSAGE_EXECUTEPATHFEEDBACK_H
#define TEDUSAR_NAV_MSGS_MESSAGE_EXECUTEPATHFEEDBACK_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace tedusar_nav_msgs
{
template <class ContainerAllocator>
struct ExecutePathFeedback_
{
  typedef ExecutePathFeedback_<ContainerAllocator> Type;

  ExecutePathFeedback_()
    : feedback(0)  {
    }
  ExecutePathFeedback_(const ContainerAllocator& _alloc)
    : feedback(0)  {
  (void)_alloc;
    }



   typedef uint32_t _feedback_type;
  _feedback_type feedback;





  typedef boost::shared_ptr< ::tedusar_nav_msgs::ExecutePathFeedback_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::tedusar_nav_msgs::ExecutePathFeedback_<ContainerAllocator> const> ConstPtr;

}; // struct ExecutePathFeedback_

typedef ::tedusar_nav_msgs::ExecutePathFeedback_<std::allocator<void> > ExecutePathFeedback;

typedef boost::shared_ptr< ::tedusar_nav_msgs::ExecutePathFeedback > ExecutePathFeedbackPtr;
typedef boost::shared_ptr< ::tedusar_nav_msgs::ExecutePathFeedback const> ExecutePathFeedbackConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::tedusar_nav_msgs::ExecutePathFeedback_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::tedusar_nav_msgs::ExecutePathFeedback_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace tedusar_nav_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'nav_msgs': ['/opt/ros/kinetic/share/nav_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'actionlib_msgs': ['/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'tedusar_nav_msgs': ['/home/ubuntu/catkin_ws/devel/share/tedusar_nav_msgs/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::tedusar_nav_msgs::ExecutePathFeedback_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::tedusar_nav_msgs::ExecutePathFeedback_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::tedusar_nav_msgs::ExecutePathFeedback_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::tedusar_nav_msgs::ExecutePathFeedback_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::tedusar_nav_msgs::ExecutePathFeedback_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::tedusar_nav_msgs::ExecutePathFeedback_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::tedusar_nav_msgs::ExecutePathFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "cbfbf3355c876d056ca78e89534a5173";
  }

  static const char* value(const ::tedusar_nav_msgs::ExecutePathFeedback_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xcbfbf3355c876d05ULL;
  static const uint64_t static_value2 = 0x6ca78e89534a5173ULL;
};

template<class ContainerAllocator>
struct DataType< ::tedusar_nav_msgs::ExecutePathFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "tedusar_nav_msgs/ExecutePathFeedback";
  }

  static const char* value(const ::tedusar_nav_msgs::ExecutePathFeedback_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::tedusar_nav_msgs::ExecutePathFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n\
# Define a feedback message\n\
uint32 feedback\n\
\n\
";
  }

  static const char* value(const ::tedusar_nav_msgs::ExecutePathFeedback_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::tedusar_nav_msgs::ExecutePathFeedback_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.feedback);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ExecutePathFeedback_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::tedusar_nav_msgs::ExecutePathFeedback_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::tedusar_nav_msgs::ExecutePathFeedback_<ContainerAllocator>& v)
  {
    s << indent << "feedback: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.feedback);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TEDUSAR_NAV_MSGS_MESSAGE_EXECUTEPATHFEEDBACK_H

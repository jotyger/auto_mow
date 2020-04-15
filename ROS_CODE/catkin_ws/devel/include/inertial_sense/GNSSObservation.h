// Generated by gencpp from file inertial_sense/GNSSObservation.msg
// DO NOT EDIT!


#ifndef INERTIAL_SENSE_MESSAGE_GNSSOBSERVATION_H
#define INERTIAL_SENSE_MESSAGE_GNSSOBSERVATION_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <inertial_sense/GTime.h>

namespace inertial_sense
{
template <class ContainerAllocator>
struct GNSSObservation_
{
  typedef GNSSObservation_<ContainerAllocator> Type;

  GNSSObservation_()
    : header()
    , time()
    , sat(0)
    , rcv(0)
    , SNR(0)
    , LLI(0)
    , code(0)
    , qualL(0)
    , qualP(0)
    , L(0.0)
    , P(0.0)
    , D(0.0)  {
    }
  GNSSObservation_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , time(_alloc)
    , sat(0)
    , rcv(0)
    , SNR(0)
    , LLI(0)
    , code(0)
    , qualL(0)
    , qualP(0)
    , L(0.0)
    , P(0.0)
    , D(0.0)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef  ::inertial_sense::GTime_<ContainerAllocator>  _time_type;
  _time_type time;

   typedef uint8_t _sat_type;
  _sat_type sat;

   typedef uint8_t _rcv_type;
  _rcv_type rcv;

   typedef uint8_t _SNR_type;
  _SNR_type SNR;

   typedef uint8_t _LLI_type;
  _LLI_type LLI;

   typedef uint8_t _code_type;
  _code_type code;

   typedef uint8_t _qualL_type;
  _qualL_type qualL;

   typedef uint8_t _qualP_type;
  _qualP_type qualP;

   typedef double _L_type;
  _L_type L;

   typedef double _P_type;
  _P_type P;

   typedef float _D_type;
  _D_type D;





  typedef boost::shared_ptr< ::inertial_sense::GNSSObservation_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::inertial_sense::GNSSObservation_<ContainerAllocator> const> ConstPtr;

}; // struct GNSSObservation_

typedef ::inertial_sense::GNSSObservation_<std::allocator<void> > GNSSObservation;

typedef boost::shared_ptr< ::inertial_sense::GNSSObservation > GNSSObservationPtr;
typedef boost::shared_ptr< ::inertial_sense::GNSSObservation const> GNSSObservationConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::inertial_sense::GNSSObservation_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::inertial_sense::GNSSObservation_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace inertial_sense

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': True}
// {'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'inertial_sense': ['/home/ubuntu/catkin_ws/src/inertial_sense_ros/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::inertial_sense::GNSSObservation_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::inertial_sense::GNSSObservation_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::inertial_sense::GNSSObservation_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::inertial_sense::GNSSObservation_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::inertial_sense::GNSSObservation_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::inertial_sense::GNSSObservation_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::inertial_sense::GNSSObservation_<ContainerAllocator> >
{
  static const char* value()
  {
    return "f652831660ce8b4781ba3cf83655ca76";
  }

  static const char* value(const ::inertial_sense::GNSSObservation_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xf652831660ce8b47ULL;
  static const uint64_t static_value2 = 0x81ba3cf83655ca76ULL;
};

template<class ContainerAllocator>
struct DataType< ::inertial_sense::GNSSObservation_<ContainerAllocator> >
{
  static const char* value()
  {
    return "inertial_sense/GNSSObservation";
  }

  static const char* value(const ::inertial_sense::GNSSObservation_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::inertial_sense::GNSSObservation_<ContainerAllocator> >
{
  static const char* value()
  {
    return "std_msgs/Header header\n\
GTime time              # time of observation\n\
uint8 sat 		# satellite number\n\
uint8 rcv 		# receiver number\n\
uint8 SNR 		# Signal Strength (0.25 dBHz)\n\
uint8 LLI 		# Loss-of-Lock Indicator (bit1=loss-of-lock, bit2=half-cycle-invalid)\n\
uint8 code 		# code indicator (BeiDou: CODE_L1I, Other: CODE_L1C )\n\
uint8 qualL 	# Estimated carrier phase measurement standard deviation (0.004 cycles)\n\
uint8 qualP 	# Estimated pseudorange measurement standard deviation (0.01 m)\n\
float64 L      	# observation data carrier-phase (cycle)\n\
float64 P      	# observation data pseudorange (m)\n\
float32 D      	# observation data doppler frequency (0.002 Hz)\n\
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
MSG: inertial_sense/GTime\n\
int64 time\n\
float64 sec\n\
";
  }

  static const char* value(const ::inertial_sense::GNSSObservation_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::inertial_sense::GNSSObservation_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.time);
      stream.next(m.sat);
      stream.next(m.rcv);
      stream.next(m.SNR);
      stream.next(m.LLI);
      stream.next(m.code);
      stream.next(m.qualL);
      stream.next(m.qualP);
      stream.next(m.L);
      stream.next(m.P);
      stream.next(m.D);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GNSSObservation_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::inertial_sense::GNSSObservation_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::inertial_sense::GNSSObservation_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "time: ";
    s << std::endl;
    Printer< ::inertial_sense::GTime_<ContainerAllocator> >::stream(s, indent + "  ", v.time);
    s << indent << "sat: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.sat);
    s << indent << "rcv: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.rcv);
    s << indent << "SNR: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.SNR);
    s << indent << "LLI: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.LLI);
    s << indent << "code: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.code);
    s << indent << "qualL: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.qualL);
    s << indent << "qualP: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.qualP);
    s << indent << "L: ";
    Printer<double>::stream(s, indent + "  ", v.L);
    s << indent << "P: ";
    Printer<double>::stream(s, indent + "  ", v.P);
    s << indent << "D: ";
    Printer<float>::stream(s, indent + "  ", v.D);
  }
};

} // namespace message_operations
} // namespace ros

#endif // INERTIAL_SENSE_MESSAGE_GNSSOBSERVATION_H

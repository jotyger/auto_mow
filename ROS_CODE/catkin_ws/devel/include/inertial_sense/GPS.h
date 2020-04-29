// Generated by gencpp from file inertial_sense/GPS.msg
// DO NOT EDIT!


#ifndef INERTIAL_SENSE_MESSAGE_GPS_H
#define INERTIAL_SENSE_MESSAGE_GPS_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <geometry_msgs/Vector3.h>
#include <geometry_msgs/Vector3.h>

namespace inertial_sense
{
template <class ContainerAllocator>
struct GPS_
{
  typedef GPS_<ContainerAllocator> Type;

  GPS_()
    : header()
    , num_sat(0)
    , fix_type(0)
    , cno(0)
    , latitude(0.0)
    , longitude(0.0)
    , altitude(0.0)
    , posEcef()
    , velEcef()
    , hMSL(0.0)
    , hAcc(0.0)
    , vAcc(0.0)
    , sAcc(0.0)
    , pDop(0.0)  {
    }
  GPS_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , num_sat(0)
    , fix_type(0)
    , cno(0)
    , latitude(0.0)
    , longitude(0.0)
    , altitude(0.0)
    , posEcef(_alloc)
    , velEcef(_alloc)
    , hMSL(0.0)
    , hAcc(0.0)
    , vAcc(0.0)
    , sAcc(0.0)
    , pDop(0.0)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef int8_t _num_sat_type;
  _num_sat_type num_sat;

   typedef uint32_t _fix_type_type;
  _fix_type_type fix_type;

   typedef int32_t _cno_type;
  _cno_type cno;

   typedef double _latitude_type;
  _latitude_type latitude;

   typedef double _longitude_type;
  _longitude_type longitude;

   typedef double _altitude_type;
  _altitude_type altitude;

   typedef  ::geometry_msgs::Vector3_<ContainerAllocator>  _posEcef_type;
  _posEcef_type posEcef;

   typedef  ::geometry_msgs::Vector3_<ContainerAllocator>  _velEcef_type;
  _velEcef_type velEcef;

   typedef float _hMSL_type;
  _hMSL_type hMSL;

   typedef float _hAcc_type;
  _hAcc_type hAcc;

   typedef float _vAcc_type;
  _vAcc_type vAcc;

   typedef float _sAcc_type;
  _sAcc_type sAcc;

   typedef float _pDop_type;
  _pDop_type pDop;



  enum {
    GPS_STATUS_FIX_TYPE_NO_FIX = 0u,
    GPS_STATUS_FIX_TYPE_DEAD_RECKONING_ONLY = 256u,
    GPS_STATUS_FIX_TYPE_2D_FIX = 512u,
    GPS_STATUS_FIX_TYPE_3D_FIX = 768u,
    GPS_STATUS_FIX_TYPE_GPS_PLUS_DEAD_RECK = 1024u,
    GPS_STATUS_FIX_TYPE_TIME_ONLY_FIX = 1280u,
    GPS_STATUS_FIX_TYPE_RESERVED1 = 1536u,
    GPS_STATUS_FIX_TYPE_RESERVED2 = 1792u,
    GPS_STATUS_FIX_STATUS_FIX_OK = 65536u,
  };


  typedef boost::shared_ptr< ::inertial_sense::GPS_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::inertial_sense::GPS_<ContainerAllocator> const> ConstPtr;

}; // struct GPS_

typedef ::inertial_sense::GPS_<std::allocator<void> > GPS;

typedef boost::shared_ptr< ::inertial_sense::GPS > GPSPtr;
typedef boost::shared_ptr< ::inertial_sense::GPS const> GPSConstPtr;

// constants requiring out of line definition

   

   

   

   

   

   

   

   

   



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::inertial_sense::GPS_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::inertial_sense::GPS_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::inertial_sense::GPS_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::inertial_sense::GPS_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::inertial_sense::GPS_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::inertial_sense::GPS_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::inertial_sense::GPS_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::inertial_sense::GPS_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::inertial_sense::GPS_<ContainerAllocator> >
{
  static const char* value()
  {
    return "6aa847d654b817ff4bb5ba8c773b2a17";
  }

  static const char* value(const ::inertial_sense::GPS_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x6aa847d654b817ffULL;
  static const uint64_t static_value2 = 0x4bb5ba8c773b2a17ULL;
};

template<class ContainerAllocator>
struct DataType< ::inertial_sense::GPS_<ContainerAllocator> >
{
  static const char* value()
  {
    return "inertial_sense/GPS";
  }

  static const char* value(const ::inertial_sense::GPS_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::inertial_sense::GPS_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# GPS status flags\n\
uint32 GPS_STATUS_FIX_TYPE_NO_FIX               = 0\n\
uint32 GPS_STATUS_FIX_TYPE_DEAD_RECKONING_ONLY  = 256\n\
uint32 GPS_STATUS_FIX_TYPE_2D_FIX               = 512\n\
uint32 GPS_STATUS_FIX_TYPE_3D_FIX               = 768\n\
uint32 GPS_STATUS_FIX_TYPE_GPS_PLUS_DEAD_RECK   = 1024\n\
uint32 GPS_STATUS_FIX_TYPE_TIME_ONLY_FIX        = 1280\n\
uint32 GPS_STATUS_FIX_TYPE_RESERVED1            = 1536\n\
uint32 GPS_STATUS_FIX_TYPE_RESERVED2            = 1792\n\
\n\
uint32 GPS_STATUS_FIX_STATUS_FIX_OK             = 65536\n\
\n\
Header header\n\
int8 num_sat 							# Number of satellites used in solution\n\
uint32 fix_type 						# Fix type, one of STATUS_FIX_TYPE flags\n\
int32 cno 								# mean carrier noise ratio (dBHz)\n\
float64 latitude 						# latitude (degrees) \n\
float64 longitude						# longitude (degrees)\n\
float64 altitude						# height above ellipsoid (not MSL) (m)\n\
geometry_msgs/Vector3 posEcef           # Position (m) in ECEF\n\
geometry_msgs/Vector3 velEcef       	# Velocity (m/s) in ECEF\n\
float32 hMSL							# height above MSL\n\
float32 hAcc							# horizontal accuracy\n\
float32 vAcc							# vertical accuracy\n\
float32 sAcc							# speed accuracy (m/s)\n\
float32 pDop							# Position Dilution of Precision (m)	\n\
\n\
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
MSG: geometry_msgs/Vector3\n\
# This represents a vector in free space. \n\
# It is only meant to represent a direction. Therefore, it does not\n\
# make sense to apply a translation to it (e.g., when applying a \n\
# generic rigid transformation to a Vector3, tf2 will only apply the\n\
# rotation). If you want your data to be translatable too, use the\n\
# geometry_msgs/Point message instead.\n\
\n\
float64 x\n\
float64 y\n\
float64 z\n\
";
  }

  static const char* value(const ::inertial_sense::GPS_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::inertial_sense::GPS_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.num_sat);
      stream.next(m.fix_type);
      stream.next(m.cno);
      stream.next(m.latitude);
      stream.next(m.longitude);
      stream.next(m.altitude);
      stream.next(m.posEcef);
      stream.next(m.velEcef);
      stream.next(m.hMSL);
      stream.next(m.hAcc);
      stream.next(m.vAcc);
      stream.next(m.sAcc);
      stream.next(m.pDop);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GPS_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::inertial_sense::GPS_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::inertial_sense::GPS_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "num_sat: ";
    Printer<int8_t>::stream(s, indent + "  ", v.num_sat);
    s << indent << "fix_type: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.fix_type);
    s << indent << "cno: ";
    Printer<int32_t>::stream(s, indent + "  ", v.cno);
    s << indent << "latitude: ";
    Printer<double>::stream(s, indent + "  ", v.latitude);
    s << indent << "longitude: ";
    Printer<double>::stream(s, indent + "  ", v.longitude);
    s << indent << "altitude: ";
    Printer<double>::stream(s, indent + "  ", v.altitude);
    s << indent << "posEcef: ";
    s << std::endl;
    Printer< ::geometry_msgs::Vector3_<ContainerAllocator> >::stream(s, indent + "  ", v.posEcef);
    s << indent << "velEcef: ";
    s << std::endl;
    Printer< ::geometry_msgs::Vector3_<ContainerAllocator> >::stream(s, indent + "  ", v.velEcef);
    s << indent << "hMSL: ";
    Printer<float>::stream(s, indent + "  ", v.hMSL);
    s << indent << "hAcc: ";
    Printer<float>::stream(s, indent + "  ", v.hAcc);
    s << indent << "vAcc: ";
    Printer<float>::stream(s, indent + "  ", v.vAcc);
    s << indent << "sAcc: ";
    Printer<float>::stream(s, indent + "  ", v.sAcc);
    s << indent << "pDop: ";
    Printer<float>::stream(s, indent + "  ", v.pDop);
  }
};

} // namespace message_operations
} // namespace ros

#endif // INERTIAL_SENSE_MESSAGE_GPS_H
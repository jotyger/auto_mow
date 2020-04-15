// Generated by gencpp from file inertial_sense/GNSSEphemeris.msg
// DO NOT EDIT!


#ifndef INERTIAL_SENSE_MESSAGE_GNSSEPHEMERIS_H
#define INERTIAL_SENSE_MESSAGE_GNSSEPHEMERIS_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <inertial_sense/GTime.h>
#include <inertial_sense/GTime.h>
#include <inertial_sense/GTime.h>

namespace inertial_sense
{
template <class ContainerAllocator>
struct GNSSEphemeris_
{
  typedef GNSSEphemeris_<ContainerAllocator> Type;

  GNSSEphemeris_()
    : header()
    , sat(0)
    , iode(0)
    , iodc(0)
    , sva(0)
    , svh(0)
    , week(0)
    , code(0)
    , flag(0)
    , toe()
    , toc()
    , ttr()
    , A(0.0)
    , e(0.0)
    , i0(0.0)
    , OMG0(0.0)
    , omg(0.0)
    , M0(0.0)
    , deln(0.0)
    , OMGd(0.0)
    , idot(0.0)
    , crc(0.0)
    , crs(0.0)
    , cuc(0.0)
    , cus(0.0)
    , cic(0.0)
    , cis(0.0)
    , toes(0.0)
    , fit(0.0)
    , f0(0.0)
    , f1(0.0)
    , f2(0.0)
    , tgd()
    , Adot(0.0)
    , ndot(0.0)  {
      tgd.assign(0.0);
  }
  GNSSEphemeris_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , sat(0)
    , iode(0)
    , iodc(0)
    , sva(0)
    , svh(0)
    , week(0)
    , code(0)
    , flag(0)
    , toe(_alloc)
    , toc(_alloc)
    , ttr(_alloc)
    , A(0.0)
    , e(0.0)
    , i0(0.0)
    , OMG0(0.0)
    , omg(0.0)
    , M0(0.0)
    , deln(0.0)
    , OMGd(0.0)
    , idot(0.0)
    , crc(0.0)
    , crs(0.0)
    , cuc(0.0)
    , cus(0.0)
    , cic(0.0)
    , cis(0.0)
    , toes(0.0)
    , fit(0.0)
    , f0(0.0)
    , f1(0.0)
    , f2(0.0)
    , tgd()
    , Adot(0.0)
    , ndot(0.0)  {
  (void)_alloc;
      tgd.assign(0.0);
  }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef int32_t _sat_type;
  _sat_type sat;

   typedef int32_t _iode_type;
  _iode_type iode;

   typedef int32_t _iodc_type;
  _iodc_type iodc;

   typedef int32_t _sva_type;
  _sva_type sva;

   typedef int32_t _svh_type;
  _svh_type svh;

   typedef int32_t _week_type;
  _week_type week;

   typedef int32_t _code_type;
  _code_type code;

   typedef int32_t _flag_type;
  _flag_type flag;

   typedef  ::inertial_sense::GTime_<ContainerAllocator>  _toe_type;
  _toe_type toe;

   typedef  ::inertial_sense::GTime_<ContainerAllocator>  _toc_type;
  _toc_type toc;

   typedef  ::inertial_sense::GTime_<ContainerAllocator>  _ttr_type;
  _ttr_type ttr;

   typedef double _A_type;
  _A_type A;

   typedef double _e_type;
  _e_type e;

   typedef double _i0_type;
  _i0_type i0;

   typedef double _OMG0_type;
  _OMG0_type OMG0;

   typedef double _omg_type;
  _omg_type omg;

   typedef double _M0_type;
  _M0_type M0;

   typedef double _deln_type;
  _deln_type deln;

   typedef double _OMGd_type;
  _OMGd_type OMGd;

   typedef double _idot_type;
  _idot_type idot;

   typedef double _crc_type;
  _crc_type crc;

   typedef double _crs_type;
  _crs_type crs;

   typedef double _cuc_type;
  _cuc_type cuc;

   typedef double _cus_type;
  _cus_type cus;

   typedef double _cic_type;
  _cic_type cic;

   typedef double _cis_type;
  _cis_type cis;

   typedef double _toes_type;
  _toes_type toes;

   typedef double _fit_type;
  _fit_type fit;

   typedef double _f0_type;
  _f0_type f0;

   typedef double _f1_type;
  _f1_type f1;

   typedef double _f2_type;
  _f2_type f2;

   typedef boost::array<double, 4>  _tgd_type;
  _tgd_type tgd;

   typedef double _Adot_type;
  _Adot_type Adot;

   typedef double _ndot_type;
  _ndot_type ndot;





  typedef boost::shared_ptr< ::inertial_sense::GNSSEphemeris_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::inertial_sense::GNSSEphemeris_<ContainerAllocator> const> ConstPtr;

}; // struct GNSSEphemeris_

typedef ::inertial_sense::GNSSEphemeris_<std::allocator<void> > GNSSEphemeris;

typedef boost::shared_ptr< ::inertial_sense::GNSSEphemeris > GNSSEphemerisPtr;
typedef boost::shared_ptr< ::inertial_sense::GNSSEphemeris const> GNSSEphemerisConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::inertial_sense::GNSSEphemeris_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::inertial_sense::GNSSEphemeris_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::inertial_sense::GNSSEphemeris_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::inertial_sense::GNSSEphemeris_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::inertial_sense::GNSSEphemeris_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::inertial_sense::GNSSEphemeris_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::inertial_sense::GNSSEphemeris_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::inertial_sense::GNSSEphemeris_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::inertial_sense::GNSSEphemeris_<ContainerAllocator> >
{
  static const char* value()
  {
    return "b950a03f405d085580c4de95aeee72ef";
  }

  static const char* value(const ::inertial_sense::GNSSEphemeris_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xb950a03f405d0855ULL;
  static const uint64_t static_value2 = 0x80c4de95aeee72efULL;
};

template<class ContainerAllocator>
struct DataType< ::inertial_sense::GNSSEphemeris_<ContainerAllocator> >
{
  static const char* value()
  {
    return "inertial_sense/GNSSEphemeris";
  }

  static const char* value(const ::inertial_sense::GNSSEphemeris_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::inertial_sense::GNSSEphemeris_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header\n\
int32 sat 		# satellite number\n\
int32 iode 		# IODE Issue of Data, Ephemeris (ephemeris version)\n\
int32 iodc 		# IODC Issue of Data, Clock (clock version)\n\
int32 sva 		# SV accuracy (URA index) IRN-IS-200H p.97            \n\
int32 svh 		# SV health GPS/QZS (0:ok)            \n\
int32 week 		# GPS/QZS: gps week, GAL: galileo week\n\
int32 code 		# GPS/QZS: code on L2 * (00=Invalid, 01 = P Code ON, 11 = C/A code ON, 11 = Invalid) * GAL/CMP: data sources\n\
int32 flag 		# GPS/QZS: L2 P data flag (indicates that the NAV data stream was commanded OFF on the P-code of the in-phase component of the L2 channel) *  CMP: nav type\n\
GTime toe 		# Toe\n\
GTime toc 		# clock data reference time (s) (20.3.4.5)\n\
GTime ttr 		# T_trans\n\
float64 A 		# Semi-Major Axis m\n\
float64 e 		# Eccentricity (no units) \n\
float64 i0 		# Inclination Angle at Reference Time (rad)\n\
float64 OMG0 	# Longitude of Ascending Node of Orbit Plane at Weekly Epoch (rad)\n\
float64 omg 	# Argument of Perigee (rad)\n\
float64 M0 		# Mean Anomaly at Reference Time (rad)\n\
float64 deln 	# Mean Motion Difference From Computed Value (rad)\n\
float64 OMGd 	# Rate of Right Ascension (rad/s)\n\
float64 idot 	# Rate of Inclination Angle (rad/s)\n\
float64 crc 	# Amplitude of the Cosine Harmonic Correction Term to the Orbit Radius\n\
float64 crs 	# Amplitude of the Sine Harmonic Correction Term to the Orbit Radius (m)\n\
float64 cuc 	# Amplitude of the Cosine Harmonic Correction Term to the Argument of Latitude (rad) \n\
float64 cus 	# Amplitude of the Sine Harmonic Correction Term to the Argument of Latitude (rad)\n\
float64 cic 	# Amplitude of the Cosine Harmonic Correction Term to the Angle of Inclination (rad)\n\
float64 cis 	# Amplitude of the Sine Harmonic Correction Term to the Angle of Inclination (rad)\n\
float64 toes 	# Reference Time Ephemeris in week (s)\n\
float64 fit 	# fit interval (h) (0: 4 hours, 1:greater than 4 hours)\n\
float64 f0 		# SV clock parameters - af0\n\
float64 f1 		# SV clock parameters - af1\n\
float64 f2 		# SV clock parameters - af2\n\
float64[4] tgd 	# group delay parameters: GPS/QZS:tgd[0]=TGD (IRN-IS-200H p.103) * GAL:tgd[0]=BGD E5a/E1,tgd[1]=BGD E5b/E1	* CMP :tgd[0]=BGD1,tgd[1]=BGD2\n\
float64 Adot 	# Adot for CNAV\n\
float64 ndot 	# ndot for CNAV\n\
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

  static const char* value(const ::inertial_sense::GNSSEphemeris_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::inertial_sense::GNSSEphemeris_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.sat);
      stream.next(m.iode);
      stream.next(m.iodc);
      stream.next(m.sva);
      stream.next(m.svh);
      stream.next(m.week);
      stream.next(m.code);
      stream.next(m.flag);
      stream.next(m.toe);
      stream.next(m.toc);
      stream.next(m.ttr);
      stream.next(m.A);
      stream.next(m.e);
      stream.next(m.i0);
      stream.next(m.OMG0);
      stream.next(m.omg);
      stream.next(m.M0);
      stream.next(m.deln);
      stream.next(m.OMGd);
      stream.next(m.idot);
      stream.next(m.crc);
      stream.next(m.crs);
      stream.next(m.cuc);
      stream.next(m.cus);
      stream.next(m.cic);
      stream.next(m.cis);
      stream.next(m.toes);
      stream.next(m.fit);
      stream.next(m.f0);
      stream.next(m.f1);
      stream.next(m.f2);
      stream.next(m.tgd);
      stream.next(m.Adot);
      stream.next(m.ndot);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GNSSEphemeris_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::inertial_sense::GNSSEphemeris_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::inertial_sense::GNSSEphemeris_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "sat: ";
    Printer<int32_t>::stream(s, indent + "  ", v.sat);
    s << indent << "iode: ";
    Printer<int32_t>::stream(s, indent + "  ", v.iode);
    s << indent << "iodc: ";
    Printer<int32_t>::stream(s, indent + "  ", v.iodc);
    s << indent << "sva: ";
    Printer<int32_t>::stream(s, indent + "  ", v.sva);
    s << indent << "svh: ";
    Printer<int32_t>::stream(s, indent + "  ", v.svh);
    s << indent << "week: ";
    Printer<int32_t>::stream(s, indent + "  ", v.week);
    s << indent << "code: ";
    Printer<int32_t>::stream(s, indent + "  ", v.code);
    s << indent << "flag: ";
    Printer<int32_t>::stream(s, indent + "  ", v.flag);
    s << indent << "toe: ";
    s << std::endl;
    Printer< ::inertial_sense::GTime_<ContainerAllocator> >::stream(s, indent + "  ", v.toe);
    s << indent << "toc: ";
    s << std::endl;
    Printer< ::inertial_sense::GTime_<ContainerAllocator> >::stream(s, indent + "  ", v.toc);
    s << indent << "ttr: ";
    s << std::endl;
    Printer< ::inertial_sense::GTime_<ContainerAllocator> >::stream(s, indent + "  ", v.ttr);
    s << indent << "A: ";
    Printer<double>::stream(s, indent + "  ", v.A);
    s << indent << "e: ";
    Printer<double>::stream(s, indent + "  ", v.e);
    s << indent << "i0: ";
    Printer<double>::stream(s, indent + "  ", v.i0);
    s << indent << "OMG0: ";
    Printer<double>::stream(s, indent + "  ", v.OMG0);
    s << indent << "omg: ";
    Printer<double>::stream(s, indent + "  ", v.omg);
    s << indent << "M0: ";
    Printer<double>::stream(s, indent + "  ", v.M0);
    s << indent << "deln: ";
    Printer<double>::stream(s, indent + "  ", v.deln);
    s << indent << "OMGd: ";
    Printer<double>::stream(s, indent + "  ", v.OMGd);
    s << indent << "idot: ";
    Printer<double>::stream(s, indent + "  ", v.idot);
    s << indent << "crc: ";
    Printer<double>::stream(s, indent + "  ", v.crc);
    s << indent << "crs: ";
    Printer<double>::stream(s, indent + "  ", v.crs);
    s << indent << "cuc: ";
    Printer<double>::stream(s, indent + "  ", v.cuc);
    s << indent << "cus: ";
    Printer<double>::stream(s, indent + "  ", v.cus);
    s << indent << "cic: ";
    Printer<double>::stream(s, indent + "  ", v.cic);
    s << indent << "cis: ";
    Printer<double>::stream(s, indent + "  ", v.cis);
    s << indent << "toes: ";
    Printer<double>::stream(s, indent + "  ", v.toes);
    s << indent << "fit: ";
    Printer<double>::stream(s, indent + "  ", v.fit);
    s << indent << "f0: ";
    Printer<double>::stream(s, indent + "  ", v.f0);
    s << indent << "f1: ";
    Printer<double>::stream(s, indent + "  ", v.f1);
    s << indent << "f2: ";
    Printer<double>::stream(s, indent + "  ", v.f2);
    s << indent << "tgd[]" << std::endl;
    for (size_t i = 0; i < v.tgd.size(); ++i)
    {
      s << indent << "  tgd[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.tgd[i]);
    }
    s << indent << "Adot: ";
    Printer<double>::stream(s, indent + "  ", v.Adot);
    s << indent << "ndot: ";
    Printer<double>::stream(s, indent + "  ", v.ndot);
  }
};

} // namespace message_operations
} // namespace ros

#endif // INERTIAL_SENSE_MESSAGE_GNSSEPHEMERIS_H

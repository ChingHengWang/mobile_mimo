#ifndef _ROS_ethercat_hardware_MotorTemperature_h
#define _ROS_ethercat_hardware_MotorTemperature_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"
#include "ros/time.h"

namespace ethercat_hardware
{

  class MotorTemperature : public ros::Msg
  {
    public:
      ros::Time stamp;
      float winding_temperature;
      float housing_temperature;
      float ambient_temperature;
      float heating_power;

    MotorTemperature():
      stamp(),
      winding_temperature(0),
      housing_temperature(0),
      ambient_temperature(0),
      heating_power(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const
    {
      int offset = 0;
      *(outbuffer + offset + 0) = (this->stamp.sec >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (this->stamp.sec >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (this->stamp.sec >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (this->stamp.sec >> (8 * 3)) & 0xFF;
      offset += sizeof(this->stamp.sec);
      *(outbuffer + offset + 0) = (this->stamp.nsec >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (this->stamp.nsec >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (this->stamp.nsec >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (this->stamp.nsec >> (8 * 3)) & 0xFF;
      offset += sizeof(this->stamp.nsec);
      offset += serializeAvrFloat64(outbuffer + offset, this->winding_temperature);
      offset += serializeAvrFloat64(outbuffer + offset, this->housing_temperature);
      offset += serializeAvrFloat64(outbuffer + offset, this->ambient_temperature);
      offset += serializeAvrFloat64(outbuffer + offset, this->heating_power);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer)
    {
      int offset = 0;
      this->stamp.sec =  ((uint32_t) (*(inbuffer + offset)));
      this->stamp.sec |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      this->stamp.sec |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      this->stamp.sec |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      offset += sizeof(this->stamp.sec);
      this->stamp.nsec =  ((uint32_t) (*(inbuffer + offset)));
      this->stamp.nsec |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      this->stamp.nsec |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      this->stamp.nsec |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      offset += sizeof(this->stamp.nsec);
      offset += deserializeAvrFloat64(inbuffer + offset, &(this->winding_temperature));
      offset += deserializeAvrFloat64(inbuffer + offset, &(this->housing_temperature));
      offset += deserializeAvrFloat64(inbuffer + offset, &(this->ambient_temperature));
      offset += deserializeAvrFloat64(inbuffer + offset, &(this->heating_power));
     return offset;
    }

    const char * getType(){ return "ethercat_hardware/MotorTemperature"; };
    const char * getMD5(){ return "d8c7239cd096d6f25b75bff6b63f2162"; };

  };

}
#endif
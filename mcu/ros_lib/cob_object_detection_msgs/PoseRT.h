#ifndef _ROS_cob_object_detection_msgs_PoseRT_h
#define _ROS_cob_object_detection_msgs_PoseRT_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace cob_object_detection_msgs
{

  class PoseRT : public ros::Msg
  {
    public:
      double rvec[3];
      double tvec[3];

    PoseRT():
      rvec(),
      tvec()
    {
    }

    virtual int serialize(unsigned char *outbuffer) const
    {
      int offset = 0;
      for( uint32_t i = 0; i < 3; i++){
      union {
        double real;
        uint64_t base;
      } u_rveci;
      u_rveci.real = this->rvec[i];
      *(outbuffer + offset + 0) = (u_rveci.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_rveci.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_rveci.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_rveci.base >> (8 * 3)) & 0xFF;
      *(outbuffer + offset + 4) = (u_rveci.base >> (8 * 4)) & 0xFF;
      *(outbuffer + offset + 5) = (u_rveci.base >> (8 * 5)) & 0xFF;
      *(outbuffer + offset + 6) = (u_rveci.base >> (8 * 6)) & 0xFF;
      *(outbuffer + offset + 7) = (u_rveci.base >> (8 * 7)) & 0xFF;
      offset += sizeof(this->rvec[i]);
      }
      for( uint32_t i = 0; i < 3; i++){
      union {
        double real;
        uint64_t base;
      } u_tveci;
      u_tveci.real = this->tvec[i];
      *(outbuffer + offset + 0) = (u_tveci.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_tveci.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_tveci.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_tveci.base >> (8 * 3)) & 0xFF;
      *(outbuffer + offset + 4) = (u_tveci.base >> (8 * 4)) & 0xFF;
      *(outbuffer + offset + 5) = (u_tveci.base >> (8 * 5)) & 0xFF;
      *(outbuffer + offset + 6) = (u_tveci.base >> (8 * 6)) & 0xFF;
      *(outbuffer + offset + 7) = (u_tveci.base >> (8 * 7)) & 0xFF;
      offset += sizeof(this->tvec[i]);
      }
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer)
    {
      int offset = 0;
      for( uint32_t i = 0; i < 3; i++){
      union {
        double real;
        uint64_t base;
      } u_rveci;
      u_rveci.base = 0;
      u_rveci.base |= ((uint64_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_rveci.base |= ((uint64_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_rveci.base |= ((uint64_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_rveci.base |= ((uint64_t) (*(inbuffer + offset + 3))) << (8 * 3);
      u_rveci.base |= ((uint64_t) (*(inbuffer + offset + 4))) << (8 * 4);
      u_rveci.base |= ((uint64_t) (*(inbuffer + offset + 5))) << (8 * 5);
      u_rveci.base |= ((uint64_t) (*(inbuffer + offset + 6))) << (8 * 6);
      u_rveci.base |= ((uint64_t) (*(inbuffer + offset + 7))) << (8 * 7);
      this->rvec[i] = u_rveci.real;
      offset += sizeof(this->rvec[i]);
      }
      for( uint32_t i = 0; i < 3; i++){
      union {
        double real;
        uint64_t base;
      } u_tveci;
      u_tveci.base = 0;
      u_tveci.base |= ((uint64_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_tveci.base |= ((uint64_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_tveci.base |= ((uint64_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_tveci.base |= ((uint64_t) (*(inbuffer + offset + 3))) << (8 * 3);
      u_tveci.base |= ((uint64_t) (*(inbuffer + offset + 4))) << (8 * 4);
      u_tveci.base |= ((uint64_t) (*(inbuffer + offset + 5))) << (8 * 5);
      u_tveci.base |= ((uint64_t) (*(inbuffer + offset + 6))) << (8 * 6);
      u_tveci.base |= ((uint64_t) (*(inbuffer + offset + 7))) << (8 * 7);
      this->tvec[i] = u_tveci.real;
      offset += sizeof(this->tvec[i]);
      }
     return offset;
    }

    const char * getType(){ return "cob_object_detection_msgs/PoseRT"; };
    const char * getMD5(){ return "d6802a5a6d10cce0b5eea91c5defc39f"; };

  };

}
#endif
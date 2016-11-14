#ifndef _ROS_SERVICE_BuildModel_h
#define _ROS_SERVICE_BuildModel_h
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace identify_family
{

static const char BUILDMODEL[] = "identify_family/BuildModel";

  class BuildModelRequest : public ros::Msg
  {
    public:
      const char* name;
      int32_t start;
      int32_t end;

    BuildModelRequest():
      name(""),
      start(0),
      end(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const
    {
      int offset = 0;
      uint32_t length_name = strlen(this->name);
      memcpy(outbuffer + offset, &length_name, sizeof(uint32_t));
      offset += 4;
      memcpy(outbuffer + offset, this->name, length_name);
      offset += length_name;
      union {
        int32_t real;
        uint32_t base;
      } u_start;
      u_start.real = this->start;
      *(outbuffer + offset + 0) = (u_start.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_start.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_start.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_start.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->start);
      union {
        int32_t real;
        uint32_t base;
      } u_end;
      u_end.real = this->end;
      *(outbuffer + offset + 0) = (u_end.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_end.base >> (8 * 1)) & 0xFF;
      *(outbuffer + offset + 2) = (u_end.base >> (8 * 2)) & 0xFF;
      *(outbuffer + offset + 3) = (u_end.base >> (8 * 3)) & 0xFF;
      offset += sizeof(this->end);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer)
    {
      int offset = 0;
      uint32_t length_name;
      memcpy(&length_name, (inbuffer + offset), sizeof(uint32_t));
      offset += 4;
      for(unsigned int k= offset; k< offset+length_name; ++k){
          inbuffer[k-1]=inbuffer[k];
      }
      inbuffer[offset+length_name-1]=0;
      this->name = (char *)(inbuffer + offset-1);
      offset += length_name;
      union {
        int32_t real;
        uint32_t base;
      } u_start;
      u_start.base = 0;
      u_start.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_start.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_start.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_start.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->start = u_start.real;
      offset += sizeof(this->start);
      union {
        int32_t real;
        uint32_t base;
      } u_end;
      u_end.base = 0;
      u_end.base |= ((uint32_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_end.base |= ((uint32_t) (*(inbuffer + offset + 1))) << (8 * 1);
      u_end.base |= ((uint32_t) (*(inbuffer + offset + 2))) << (8 * 2);
      u_end.base |= ((uint32_t) (*(inbuffer + offset + 3))) << (8 * 3);
      this->end = u_end.real;
      offset += sizeof(this->end);
     return offset;
    }

    const char * getType(){ return BUILDMODEL; };
    const char * getMD5(){ return "14b641eed34ac6a204cf2c350abe36e9"; };

  };

  class BuildModelResponse : public ros::Msg
  {
    public:
      const char* status;

    BuildModelResponse():
      status("")
    {
    }

    virtual int serialize(unsigned char *outbuffer) const
    {
      int offset = 0;
      uint32_t length_status = strlen(this->status);
      memcpy(outbuffer + offset, &length_status, sizeof(uint32_t));
      offset += 4;
      memcpy(outbuffer + offset, this->status, length_status);
      offset += length_status;
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer)
    {
      int offset = 0;
      uint32_t length_status;
      memcpy(&length_status, (inbuffer + offset), sizeof(uint32_t));
      offset += 4;
      for(unsigned int k= offset; k< offset+length_status; ++k){
          inbuffer[k-1]=inbuffer[k];
      }
      inbuffer[offset+length_status-1]=0;
      this->status = (char *)(inbuffer + offset-1);
      offset += length_status;
     return offset;
    }

    const char * getType(){ return BUILDMODEL; };
    const char * getMD5(){ return "4fe5af303955c287688e7347e9b00278"; };

  };

  class BuildModel {
    public:
    typedef BuildModelRequest Request;
    typedef BuildModelResponse Response;
  };

}
#endif

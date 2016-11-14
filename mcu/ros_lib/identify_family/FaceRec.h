#ifndef _ROS_SERVICE_FaceRec_h
#define _ROS_SERVICE_FaceRec_h
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace identify_family
{

static const char FACEREC[] = "identify_family/FaceRec";

  class FaceRecRequest : public ros::Msg
  {
    public:
      const char* request;

    FaceRecRequest():
      request("")
    {
    }

    virtual int serialize(unsigned char *outbuffer) const
    {
      int offset = 0;
      uint32_t length_request = strlen(this->request);
      memcpy(outbuffer + offset, &length_request, sizeof(uint32_t));
      offset += 4;
      memcpy(outbuffer + offset, this->request, length_request);
      offset += length_request;
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer)
    {
      int offset = 0;
      uint32_t length_request;
      memcpy(&length_request, (inbuffer + offset), sizeof(uint32_t));
      offset += 4;
      for(unsigned int k= offset; k< offset+length_request; ++k){
          inbuffer[k-1]=inbuffer[k];
      }
      inbuffer[offset+length_request-1]=0;
      this->request = (char *)(inbuffer + offset-1);
      offset += length_request;
     return offset;
    }

    const char * getType(){ return FACEREC; };
    const char * getMD5(){ return "9b13f31f7a0a36901919f7ec0d9f40d4"; };

  };

  class FaceRecResponse : public ros::Msg
  {
    public:
      const char* anwser;

    FaceRecResponse():
      anwser("")
    {
    }

    virtual int serialize(unsigned char *outbuffer) const
    {
      int offset = 0;
      uint32_t length_anwser = strlen(this->anwser);
      memcpy(outbuffer + offset, &length_anwser, sizeof(uint32_t));
      offset += 4;
      memcpy(outbuffer + offset, this->anwser, length_anwser);
      offset += length_anwser;
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer)
    {
      int offset = 0;
      uint32_t length_anwser;
      memcpy(&length_anwser, (inbuffer + offset), sizeof(uint32_t));
      offset += 4;
      for(unsigned int k= offset; k< offset+length_anwser; ++k){
          inbuffer[k-1]=inbuffer[k];
      }
      inbuffer[offset+length_anwser-1]=0;
      this->anwser = (char *)(inbuffer + offset-1);
      offset += length_anwser;
     return offset;
    }

    const char * getType(){ return FACEREC; };
    const char * getMD5(){ return "02226e42067ed0c3093dfbdb06a8d363"; };

  };

  class FaceRec {
    public:
    typedef FaceRecRequest Request;
    typedef FaceRecResponse Response;
  };

}
#endif

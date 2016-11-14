#include <ros/ros.h>
#include <tf/transform_broadcaster.h>
#include <iostream>
using namespace std;

geometry_msgs::Twist u;
double v = 0;
double w = 0;
ros::Publisher u_pub;
ros::Subscriber vw_sub;

void in_linear(){
	u.linear.x = 10;
	u.angular.z = 0;
    u_pub.publish(u);
}
void in_angular(){
	u.linear.x = 0;
	u.angular.z = 8;
    u_pub.publish(u);
}
void vwCallback(const geomstry_msgs::Twist& msg){
   v=msg.linear.x;
   w=msg.angular.z;

}


int main(int argc, char** argv){
  ros::init(argc, argv, "id_test");
  ros::NodeHandle n1;

  u_pub = n1.advertise<geometry_msgs::Twist>("andbot/cmd_vel", 50);
  vw_sub = n1.subscribe("/andbot/feedback_vel", 50, vwCallback);

  ros::Rate loop_rate(1000);

  while(ros::ok())
  {

	in_linear();


    ros::spinOnce();
    loop_rate.sleep();
  }
}



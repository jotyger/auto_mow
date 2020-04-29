#include <ros/ros.h>
#include "std_msgs/String.h"
#include <wiringPi.h>
#include <string>
#define LED_PIN 4

void callback(const std_msgs::String::ConstPtr& msg)
{
    ROS_INFO("I heard: [%s]", msg->data.c_str());
    std::string data = msg->data.c_str();
    int state;

    if (data == "1")    { 
	ROS_INFO("Set GPIO HIGH");
	digitalWrite(LED_PIN, HIGH);
	state = digitalRead(LED_PIN);
        ros::Duration(1.0).sleep();
    }     else if (data == "0")    {
	ROS_INFO("Set GPIO LOW");
	digitalWrite(LED_PIN, LOW);
        state = digitalRead(LED_PIN);
        ros::Duration(1.0).sleep();
     }     else    {
	ROS_INFO("I am not true or false");
    }

    ROS_INFO("%i", state);
}


int main (int argc, char **argv)
{
    ros::init(argc, argv, "test_wiringpi_ros");
    ros::NodeHandle n;

    wiringPiSetupGpio();
    pinMode(LED_PIN, OUTPUT);
    ROS_INFO("GPIO has been set as OUTPUT.");


    ros::Subscriber sub = n.subscribe("GPIO4", 1, callback);
    ros::spin();
    
}




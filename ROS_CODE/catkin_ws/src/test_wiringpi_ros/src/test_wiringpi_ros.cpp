#include <ros/ros.h>
#include "std_msgs/String.h"
#include <wiringPi.h>
#include <string>
#define LEFT 4
#define RIGHT 5

void callback_GPIO4(const std_msgs::String::ConstPtr& msg)
{
    ROS_INFO("Request to Change GPIO 4 to: [%s]", msg->data.c_str());
    std::string data = msg->data.c_str();
    int state;

    if (data == "1")    { 
	digitalWrite(LEFT, HIGH);
        ROS_INFO("Set GPIO4 HIGH");
	state = digitalRead(LEFT);
        //ros::Duration(1.0).sleep();
    }     else if (data == "0")    {
	digitalWrite(LEFT, LOW);
	ROS_INFO("Set GPIO4 LOW");
        state = digitalRead(LEFT);
        //ros::Duration(1.0).sleep();
     }     else    {
	ROS_WARN("Invalid Input");
    }

    ROS_INFO("New GPIO4 State: [%i]", state);
}

void callback_GPIO5(const std_msgs::String::ConstPtr& msg)
{
    ROS_INFO("Request to Change GPIO 5 to: [%s]", msg->data.c_str());
    std::string data = msg->data.c_str();
    int state;

    if (data == "1")    { 
	digitalWrite(RIGHT, HIGH);
        ROS_INFO("Set GPIO5 HIGH");
	state = digitalRead(RIGHT);
        //ros::Duration(1.0).sleep();
    }     else if (data == "0")    {
	digitalWrite(RIGHT, LOW);
	ROS_INFO("Set GPIO5 LOW");
        state = digitalRead(RIGHT);
        //ros::Duration(1.0).sleep();
     }     else    {
	ROS_WARN("Invalid Input");
    }

    ROS_INFO("New GPIO5 State: [%i]", state);
}


int main (int argc, char **argv)
{
    ros::init(argc, argv, "test_wiringpi_ros");
    ros::NodeHandle n;

    //Setup WiringPi, set pins as inputs/outputs
    wiringPiSetupGpio();
    
    //LEFT ACTUATOR
    pinMode(LEFT, OUTPUT);
    ROS_INFO("GPIO4 has been set as OUTPUT.");
    
    //RIGHT ACTUATOR
    pinMode(RIGHT, OUTPUT);
    ROS_INFO("GPIO5 has been set as OUTPUT.");

    ros::Subscriber sub4 = n.subscribe("GPIO4", 1, callback_GPIO4);
    ros::Subscriber sub5 = n.subscribe("GPIO5", 1, callback_GPIO5);
    ros::spin();
    
}




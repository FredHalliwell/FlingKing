extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var singleton_mouse1_pos
var singleton_mouse2_pos

var singleton_angle_to_aim

var angle_between_positions

var singleton_player_pos

var singleton_shoot_direction

var singleton_player_position

var singleton_create_preview_instance

var singleton_player_object 

var singleton_player_velocity


var singleton_launch_preview_ball

#LAUNCH PREVIEW BALL SINGLETONS
################
var player_mouse_position_1
var player_mouse_position_2
var player_shoot_angle
################

var player_preview_position

var singleton_trajectory1_position
var singleton_trajectory2_position
var singleton_trajectory3_position
var singleton_trajectory4_position
var singleton_trajectory5_position
var singleton_trajectory6_position
var singleton_preview_timer

#body for flat_platform for collision_exception
var singleton_flat_platform_object

#passes direction of moving_platform to player/preview body to alter impulse based on platform direction
var moving_platform_direction = "none"

var singleton_player_colliding_with

var singleton_player_on_vertical_platform
var singleton_vertical_platform_direction

var vertical_platform_raycast

var screenpress
var screenrelease
var screenpressheld

var singleton_switch_platform_timer = 0

var switch_platform_area_scale

var abs_player_velocity= 0

var create_checkpoint_message_instance
var checkpoint_message_exists

var test_player_colour=Color(1,1,1)

var play_interstital_singleton = false

var singleton_current_checkpoint_position

var reject_checkpoint

var camera_position

var checkpoint_reminder_object_singleton






class_name PlayerState extends Node

#region 这是一行注释 

#endregion

var palyer : Player
var next_state : PlayerState

func init() -> void:
	pass
	
func enter() -> void :
	pass
	
func exit() -> void :
	pass
	
func handle_input( _event : InputEvent) -> PlayerState :
	return next_state
	
func process(delta: float) -> PlayerState:
	return next_state
	
func physics_process(delta: float) -> PlayerState:
	return next_state
	
	
	

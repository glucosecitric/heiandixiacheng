class_name PlayerState extends Node

#region 这是一行注释 
@onready var idle: PlayerStateIdle = %Idle
@onready var run: PlayerStateRun = %Run 
@onready var jump: PlayerStateJump = %Jump
@onready var fall: PlayerStateFall = %Fall

#endregion

var player : Player
var next_state : PlayerState

func init() -> void:
	pass
	
func enter() -> void :
	pass
	
func exit() -> void :
	pass
	
func handle_input( _event : InputEvent) -> PlayerState :
	return next_state
	
func process(_delta: float) -> PlayerState:
	return next_state
	
func physics_process(_delta: float) -> PlayerState:
	return next_state
	
	
	

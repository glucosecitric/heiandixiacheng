class_name Player extends CharacterBody2D

var direction : Vector2 = Vector2.ZERO
var gravity = 880

#region #状态机的变量
var states : Array[ PlayerState ]
#目前状态
var current_state : PlayerState : 
	get : return states.front()
#上一个状态
var pervious_state : PlayerState :
	get : return states[ 1 ]
#endregion

func _ready() -> void:
	initialize_states()
	pass

func _process(delta: float) -> void:
	pass

func _physics_process(_delta: float) -> void:

#region  被注释的运动代码
	#velocity.x = 0.0
	#if Input.is_action_pressed("left"):
		#velocity.x = -100
	#elif Input.is_action_pressed("right"):
		#velocity.x = 100
#
	#velocity.y += 690 * _delta
	#move_and_slide()
#endregion
	pass

func initialize_states() -> void :
	states = []
	for c in $States.get_children():
		if c is PlayerState:
			states.append( c )
			c.player = self
		pass
	if states.size() == 0:
		return 
	
	for state in states :
		state.init()
	
	current_state.enter()
	change_state( current_state )
	pass 	
	
func change_state( new_state : PlayerState ):
	if new_state == null :
		return
	elif new_state == current_state :
		return 
	
	if current_state :
		current_state.exit()
	
	states.push_front( new_state )
	current_state.enter()
	states.resize( 4 )
	pass 
	
	
	
	
	

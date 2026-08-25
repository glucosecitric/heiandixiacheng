class_name Player extends CharacterBody2D

const DEBUG_JUMP_INDICATOR = preload("uid://c4vbt0divsu3t")


var direction : Vector2 = Vector2.ZERO
var gravity = 880
@export var move_speed : float = 100

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

func _unhandled_input(event: InputEvent) -> void:
	change_state( current_state.handle_input( event ))
	pass

func _process(_delta: float) -> void:
	update_direction()
	change_state( current_state.process(_delta	))
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
	
	velocity.y += gravity * _delta
	move_and_slide()
	change_state( current_state.physics_process( _delta ) )
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
	$Label.text = current_state.name
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
	$Label.text = current_state.name
	pass 
	
func update_direction()->void:
	var prev_direction : Vector2 = direction
	var x_axis = Input.get_axis("left","right")
	var y_axis = Input.get_axis("up","down")
	direction = Vector2(x_axis,y_axis)
	pass
	
func add_debug_indicator( color : Color  = Color.RED )->void:
	var d : Node2D = DEBUG_JUMP_INDICATOR.instantiate()
	get_tree().root.add_child(d)
	d.global_position = global_position
	d.modulate = color
	await get_tree().create_timer( 3.0 ).timeout
	d.queue_free()
	pass
	
	

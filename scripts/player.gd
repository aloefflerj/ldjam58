extends CharacterBody2D


@export var phase_path: String
@export var level_entrance_wait_duration: float = 0.0
@export var start_animation: PlayerState = PlayerState.IDLE
@export var start_flipped = false
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var sound_player: AudioStreamPlayer2D = $SoundPlayer


const SPEED = 100.0
const JUMP_VELOCITY = -300.0

enum PlayerState {IDLE, RUN, JUMP, FALL, HIT, WONDERING}

var _state: PlayerState = PlayerState.IDLE
var sound_played = false
var input_enabled = false
var got_hit = false
var waiting_before_level_start = true

func _ready() -> void:
	
	if (start_flipped):
		animated_sprite_2d.flip_h = true

	set_state(start_animation)

	await get_tree().create_timer(level_entrance_wait_duration).timeout
	input_enabled = true
	waiting_before_level_start = false

func _physics_process(delta: float) -> void:
	handle_movement_input_behaviour()
	hit_slow_down()

	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if velocity.x > 0 and not got_hit:
		animated_sprite_2d.flip_h = false
	
	if velocity.x < 0 and not got_hit:
		animated_sprite_2d.flip_h = true
	
	## Example of iteraction between player and a rigid body 2d
	var collision: KinematicCollision2D = get_last_slide_collision()
	
	if collision:
		var collider_node = collision.get_collider()
		
		if collider_node is RigidBody2D:
			var collision_normal: Vector2 = collision.get_normal()
			var push_force = 100
			var push_direction = - collision_normal * push_force
			
			collider_node.apply_central_impulse(push_direction)
			
			if not sound_played:
				sound_played = true

				await get_tree().create_timer(0.5).timeout
				sound_played = false
	
	move_and_slide()
	calculate_states()


func calculate_states() -> void:
	if waiting_before_level_start:
		return

	if got_hit:
		set_state(PlayerState.HIT)
		return

	if is_on_floor() == true:
		if velocity.x == 0:
			set_state(PlayerState.IDLE)
		else:
			set_state(PlayerState.RUN)
	else:
		if velocity.y > 0:
			set_state(PlayerState.FALL)
		else:
			set_state(PlayerState.JUMP)


func set_state(new_state: PlayerState) -> void:
	if new_state == _state:
		return
		
	_state = new_state
	
	match _state:
		PlayerState.IDLE:
			animated_sprite_2d.play("idle")
		PlayerState.RUN:
			animated_sprite_2d.play("run")
		PlayerState.JUMP:
			animated_sprite_2d.play("jump")
		PlayerState.FALL:
			animated_sprite_2d.play("fall")
		PlayerState.HIT:
			animated_sprite_2d.play("hit")
		PlayerState.WONDERING:
			animated_sprite_2d.play("wondering")


func handle_movement_input_behaviour() -> void:
	if not input_enabled:
			return

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY * GameManager.power_up_jump_multiply

	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)


func hit_slow_down() -> void:
	if not got_hit:
		return

	velocity.x = move_toward(velocity.x, 0, 20.0)


func _on_phase_end_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_tree().call_deferred("change_scene_to_file", phase_path)


func _on_repel_spell_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		input_enabled = false
		got_hit = true
		velocity = Vector2(-500, -50)
		
		if self.got_hit:
			await get_tree().create_timer(1.6).timeout
			GameManager.end_game()

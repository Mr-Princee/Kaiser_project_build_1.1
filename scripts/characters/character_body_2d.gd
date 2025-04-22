extends CharacterBody2D

@onready var anim = $AnimatedSprite2D

var moving = true
var speed = 60

func _ready() -> void:
	moving = false
	Dialogic.signal_event.connect(DialogicSignal)
	


func DialogicSignal(argument: String):
	if argument == "isla":
		moving = true
		anim.play("walk")
		await get_tree().create_timer(4.0).timeout
		anim.stop()
		moving = false





func _physics_process(delta):
	if moving:
		velocity.x = speed
	else:
		velocity.x = 0
		
	move_and_slide()

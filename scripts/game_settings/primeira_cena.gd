extends Node2D

@onready var prota := $MainChar
@onready var osvaldo := $Detetive


func _ready():
	Dialogic.paused = false
	var dialogic = Dialogic.start("Cena1_2")
	Dialogic.signal_event.connect(DialogicSignal)


func DialogicSignal(argument: String):
	if argument == "isla":
		$MainChar.scale.x = 1
		osvaldo.visible = false
	elif argument == "scene_switch":
		get_tree().change_scene_to_file("res://scenes/levels/lindobar.tscn")
	

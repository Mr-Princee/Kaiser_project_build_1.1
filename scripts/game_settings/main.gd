extends Node2D  # ou Node2D, dependendo da sua cena
@onready var background1 := $ColorRect
@onready var osvaldo := $Detetive
@onready var prota := $MainChar 
@onready var background := $Background1 

func _ready():
	#Conexao com sinal do Dialogic
	Dialogic.signal_event.connect(DialogicSignal)
	#Startando a Cena1 da timelina
	var dialogic = Dialogic.start("Cena1")
	
	osvaldo.visible = false
	background.visible = false
	prota.visible = false
	background1.visible = true
	
	
func DialogicSignal(argument:String):
	if argument == "primeiraCena":
		osvaldo.visible = true
		prota.visible = true
		background.visible = true
		background1.visible = false
	elif argument == "tutoras":
		get_tree().change_scene_to_file("res://scenes/levels/tutoras.tscn")
		Dialogic.paused = true
	elif argument == "scene_switch":
		get_tree().change_scene_to_file("res://scenes/levels/lindobar.tscn")
	elif argument == "isla":
		$MainChar.scale.x = 1
		osvaldo.visible = false
		

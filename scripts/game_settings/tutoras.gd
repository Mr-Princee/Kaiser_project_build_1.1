extends Node2D

@onready var label_turno = $CanvasLayer/UI/LabelTurno
@onready var btn_ataque = $CanvasLayer/UI/ataque
@onready var btn_defesa = $CanvasLayer/UI/defesa
var player_hp = 100
var detetive_hp = 100
var turno_do_jogador = true

func _ready():
	# Conecta os sinais
	btn_ataque.pressed.connect(_on_ataque)
	btn_defesa.pressed.connect(_on_defesa)

#Função de ataque do Player

func _on_ataque():
	if turno_do_jogador:
		var damage = calculate_damage("player")
		detetive_hp -= damage
		label_turno.text = "Você atacou! Inimigo atacando..."
		turno_do_jogador = false
		await get_tree().create_timer(1.5).timeout
		_inimigo_agir()
		enemy_dies()

func _on_defesa():
	if turno_do_jogador:
		label_turno.text = "Você defendeu! Inimigo atacando..."
		turno_do_jogador = false
		await get_tree().create_timer(1.5).timeout
		_inimigo_agir()

#Função de ataque do Inimigo

func _inimigo_agir():
	var damage = calculate_damage("enemy")
	player_hp -= damage
	label_turno.text = "Inimigo atacando!"
	await get_tree().create_timer(2.0).timeout
	label_turno.text = "Agora é sua vez"
	turno_do_jogador = true
	player_dies()

#Função de Calcular o Dano do player e inimigo

func calculate_damage(who):
	if who == "player":
		print("HP do detetive:", detetive_hp)
		return 50
	elif who == "enemy":
		print("HP do player:", player_hp)
		return 10


func enemy_dies():
	if detetive_hp == 0:
		get_tree().change_scene_to_file("res://scenes/levels/primeiraCena.tscn")
		
func player_dies():
	if player_hp == 0:
		get_tree().change_scene_to_file("res://scenes/levels/tutoras.tscn")
	

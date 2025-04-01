extends Area3D

var control : Control
var player : CharacterBody3D
var audio_player : AudioStreamPlayer

func _ready():
	control = get_tree().root.get_node("Node3D/Player/Control")
	player = get_tree().root.get_node("Node3D/Player")
	audio_player = $"Sons"

func _process(delta):
	var max_distance = 500

	# Calculer la distance entre le joueur et l'Area3D
	var distance = player.global_position.distance_to(global_position)
	if distance < max_distance:
		var volume = 1.0 - (distance / max_distance)
		audio_player.volume_db = lerp(-80, 0, volume)
	else:
		audio_player.volume_db = -80
	
func _on_body_entered(body):
	if body is CharacterBody3D:
		control.visible = true

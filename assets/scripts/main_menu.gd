extends MarginContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	$AnimationPlayer.play("fade_to_black_transition")
	pass # Replace with function body.


func start_game():
	get_tree().change_scene_to_file("res://assets/scenes/game.tscn")

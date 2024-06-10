extends Node2D
@onready var player = $Player


# Called when the node enters the scene tree for the first time.
func _ready():
	player.hit.connect(_hit)
	$"Lightning Medium".connect("hit", _hit)
	$"Lightning Small".connect("hit", _hit)
	$"Lightning Long".connect("hit", _hit)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _hit():
	player.death()
	pass

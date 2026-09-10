extends Area3D

signal key_collected

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.name == "Player":
		key_collected.emit()
		queue_free()

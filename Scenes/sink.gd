extends StaticBody2D

var interactable := false
func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		interactable = true
		while interactable and not Input.is_action_pressed("interact"):
			await get_tree().process_frame
		if Input.is_action_just_pressed("interact"):
			body.sink += 1
			body._update_UI()

func _on_interact_area_body_exited(_body: Node2D) -> void: interactable = false

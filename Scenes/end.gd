extends StaticBody2D

var index := 0
var interactable := false
func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		interactable = true
		while interactable and not Input.is_action_pressed("interact"):
			await get_tree().process_frame
		if Input.is_action_just_pressed("interact"):
			process_mode = Node.PROCESS_MODE_ALWAYS
			get_tree().paused = true
			$CanvasLayer.show()
			$CanvasLayer/Panel/CenterContainer/VBoxContainer/Score.text = "Your Score?\n%s" % body.score
			if body.score <= 16:
				$CanvasLayer/Panel/CenterContainer/VBoxContainer/Score.text = "%s - really? Were you even trying? Have a proper go." % body.score

func _on_interact_area_body_exited(_body: Node2D) -> void: interactable = false

func _on_confirm_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()

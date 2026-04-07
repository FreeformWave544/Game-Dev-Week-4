extends StaticBody2D

var index := 0
var interactable := false
func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		interactable = true
		while interactable and not Input.is_action_pressed("interact"):
			await get_tree().process_frame
		if Input.is_action_just_pressed("interact"):
			$CanvasLayer.show()
			$CanvasLayer/Panel/CenterContainer/VBoxContainer/OptionButton.clear()
			for salad in body.matchAll():
				$CanvasLayer/Panel/CenterContainer/VBoxContainer/OptionButton.add_item(salad)
			index = min(index + 1, body.find_child("UI").get_child_count())
			body._update_UI()

func _on_interact_area_body_exited(_body: Node2D) -> void: interactable = false

func _on_confirm_pressed() -> void:
	$CanvasLayer.hide()
	var item = $CanvasLayer/Panel/CenterContainer/VBoxContainer/OptionButton.get_selected_id()
	if item == -1: return
	var player := get_parent().find_child("Player")
	player.salad.remove_at(item)
	player._update_UI()
	if player.sink > 0:
		player.score += 10
	else:
		player.score += 2
	player.sink -= 1

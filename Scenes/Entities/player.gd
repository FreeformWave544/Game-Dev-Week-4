extends CharacterBody2D
class_name Player

const SPEED := 300.0
const JUMP_VELOCITY := -400.0
var salad = []
var saladCount := 0
var sink := 0
var score := 0

func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("left", "right", "up", "down")
	velocity = direction * SPEED
	move_and_slide()

func _update_UI() -> void:
	var existingSaladCount = len($UI.get_children())
	if existingSaladCount > len(salad):
		for i in range(existingSaladCount - 1, len(salad) - 1, -1):
			$UI.get_child(i).queue_free()
		for s in range(len(salad)):
			$UI.get_child(s).frame = salad[s]
	for i in range(len(salad)):
		if i >= existingSaladCount:
			var newSalad = $Salad.duplicate(0)
			$UI.add_child(newSalad)
			newSalad.frame = salad[i]
			newSalad.show()
		var currentSalad = $UI.get_child(i)
		if i % 2 == 0: currentSalad.global_position.x = (1152.0/2) + ((128.0 * currentSalad.scale.x) * i - (128.0 * (currentSalad.scale.x - 1) / 2)) / 2
		else: currentSalad.global_position.x = (1152.0/2) - ((128.0 * currentSalad.scale.x) * i - (128.0 * (currentSalad.scale.x - 1) / 2)) / 2

func matchSalad(num):
	var saladName = ""
	match num:
		0: saladName = "Shredded Cabbage"
		1: saladName = "Vegetable Dressing Salad"
		2: saladName = "Ham and Cucumber Salad"
		3: saladName = "Potato Salad"
		4: saladName = "Avocado Salad"
		5: saladName = "Pumpkin Salad"
		6: saladName = "Carrot Shirishiri"
		7: saladName = "Fruit Salad"
		8: saladName = "Onion Salad"
		9: saladName = "Fancy Salad"
		10: saladName = "Shrimp Salad"
		11: saladName = "Egg Salad"
		12: saladName = "Kochori Salad"
		13: saladName = "Caesar Salad"
		14: saladName = "Tomato Salad"
		15: saladName = "Simple Salad"
	return saladName

func matchAll():
	var saladName = []
	for s in salad:
		match s:
			0: saladName.append("Shredded Cabbage")
			1: saladName.append("Vegetable Dressing Salad")
			2: saladName.append("Ham and Cucumber Salad")
			3: saladName.append("Potato Salad")
			4: saladName.append("Avocado Salad")
			5: saladName.append("Pumpkin Salad")
			6: saladName.append("Carrot Shirishiri")
			7: saladName.append("Fruit Salad")
			8: saladName.append("Onion Salad")
			9: saladName.append("Fancy Salad")
			10: saladName.append("Shrimp Salad")
			11: saladName.append("Egg Salad")
			12: saladName.append("Kochori Salad")
			13: saladName.append("Caesar Salad")
			14: saladName.append("Tomato Salad")
			15: saladName.append("Simple Salad")
	return saladName

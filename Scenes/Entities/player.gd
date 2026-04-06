extends CharacterBody2D
class_name Player

const SPEED := 300.0
const JUMP_VELOCITY := -400.0
var salad = []
var saladCount := 0

func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("left", "right", "up", "down")
	velocity = direction * SPEED
	move_and_slide()

func _update_UI() -> void:
	var existingSaladCount = len($UI.get_children())
	for i in range(len(salad)):
		if i >= existingSaladCount:
			var newSalad = $Salad.duplicate(0)
			$UI.add_child(newSalad)
			newSalad.frame = salad[i]
			newSalad.show()
		var currentSalad = $UI.get_child(i)
		currentSalad.global_position.x = (128 * currentSalad.scale.x) * i - (128 * (currentSalad.scale.x - 1) / 2)
	#var saladName = ""
	#match salad[i]:
		#0: saladName = "Shredded Cabbage"
		#1: saladName = "Vegetable Dressing Salad"
		#2: saladName = "Ham and Cucumber Salad"
		#3: saladName = "Potato Salad"
		#4: saladName = "Avocado Salad"
		#5: saladName = "Pumpkin Salad"
		#6: saladName = "Carrot Shirishiri"
		#7: saladName = "Fruit Salad"
		#8: saladName = "Onion Salad"
		#9: saladName = "Fancy Salad"
		#10: saladName = "Shrimp Salad"
		#11: saladName = "Egg Salad"
		#12: saladName = "Kochori Salad"
		#13: saladName = "Caesar Salad"
		#14: saladName = "Tomato Salad"
		#15: saladName = "Simple Salad"

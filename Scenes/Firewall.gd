extends Panel

signal done

func _physics_process(delta: float) -> void:
	if visible:
		$ProgressBar.value -= 5.0 * delta

func _on_visibility_changed() -> void:
	while visible:
		$Block.position = Vector2(randf_range(50, 450), randf_range(50, 450))
		await $Block.pressed
		$ProgressBar.value += randf_range(7.5, 10.0)
		if $ProgressBar.value == 100.0: break
	hide()
	$"../../FirewallCollider/CollisionShape2D".queue_free()
	$"../../FirewallCollider/Firewall/CollisionShape2D".queue_free()
	done.emit()

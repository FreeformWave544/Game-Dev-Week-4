extends Area2D

@onready var particle_system: GPUParticles2D = $GPUParticles2D
func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.score += 1
		$CollisionShape2D.set_deferred("disabled", true)
		for i in range(200):
			$GPUParticles2D.fixed_fps = randi_range(1, 30)
			await get_tree().process_frame
		await get_tree().create_timer(0.1).timeout
		var player_position = get_parent().find_child("Player").global_position
		$GPUParticles2D.process_material.gravity = Vector3(player_position.x, player_position.y, 0.0)
		$GPUParticles2D.fixed_fps = 30
		$GPUParticles2D.speed_scale = 3.0
		$GPUParticles2D.one_shot = true
		await get_tree().create_timer(8.4).timeout
		modulate = Color(0.5, 0.7, 0.5, 0.3)

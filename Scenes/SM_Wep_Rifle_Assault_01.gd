extends MeshInstance3D
	
func _input(event):
	if event is InputEventMouseButton:
		$AnimationPlayer.play("shoot")

@tool
class_name Gate extends StaticBody3D

@export_tool_button("Open", "Unlock") var open_gate = open
@export_tool_button("Close", "Lock") var close_gate = close
@onready var collision_shape = $CollisionShape3D
@onready var closed_particles_1 = $GPUParticles3D
@onready var closed_particles_2 = $GPUParticles3D2
@onready var open_particles = $GPUParticles3D3

@onready var shader: ShaderMaterial = $MeshInstance3D.get_surface_override_material(0)
	

func _ready() -> void:
	shader.set_shader_parameter("emission_color", Color("8200ff"))
	close()
	
func open() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED
	collision_shape.disabled = true
	closed_particles_1.emitting = false
	closed_particles_2.emitting = false
	open_particles.emitting = true
	shader.set_shader_parameter("emission_color", Color("7eff00"))


func close() -> void:
	process_mode = Node.PROCESS_MODE_INHERIT
	collision_shape.disabled = false
	closed_particles_1.emitting = true
	closed_particles_2.emitting = true
	open_particles.emitting = false
	shader.set_shader_parameter("emission_color", Color("8200ff"))
	

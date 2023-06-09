extends Control
@onready var crosshair:ColorRect=$Crosshair_2
@onready var crosshair_material:ShaderMaterial
@onready var tween:Tween
@onready var timer:Timer=$Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	crosshair_material=crosshair.material
	pass # Replace with function body.


func _input(event: InputEvent) -> void:
	var tween:Tween
	var spread=crosshair_material.get_shader_parameter("spread")
	
	if event.is_action_pressed("shoot"):
		print("hit")
		tween=get_tree().create_tween()
		spread=0.13
		tween.tween_property(crosshair_material,"shader_parameter/spread",spread,0.5)
		await(1.0)
		tween.tween_property(crosshair_material,"shader_parameter/spread",0.0,0.9)
	
		

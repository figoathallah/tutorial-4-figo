extends Node2D

export var sceneName = "LoseScreen2"

var tween = Tween
var startPos = Vector2()
var endPos = Vector2()
var distance = 300.0
var moveDuration = 2.0
var reverse = false

# Called when the node enters the scene tree for the first time.
func _ready():
	tween = $Tween
	startPos = global_position
	endPos = Vector2(startPos.x - distance, startPos.y)
	move_sawblade()

func move_sawblade():
	var targetPos = Vector2()
	if reverse:
		targetPos = startPos
	else:
		targetPos = endPos
	tween.interpolate_property(self, "position", position, targetPos, moveDuration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.connect("tween_completed", self, "_on_tween_completed")
	tween.start()
	
func _on_tween_completed(object, key):
	reverse = !reverse
	move_sawblade()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Saw_body_entered(body):
	if body.get_name() == "Player":
		get_tree().change_scene(str("res://scenes/" + sceneName + ".tscn"))

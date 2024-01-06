extends Node2D
class_name Character

@export var is_player :bool
@export var current_hp :int = 25
@export var max_hp :int = 25

@export var combat_actions :Array
@export var opponent :Node

@onready var health_bar :ProgressBar = get_node("HealthBar")
@onready var health_text :Label = get_node("HealthBar/HealthBarText")
# Called when the node enters the scene tree for the first time.
func _ready():
	health_bar.max_value = max_hp

func _update_health_bar():
	health_bar.value = current_hp
	health_text.text = str(current_hp, " / ", max_hp)
	
func _take_damage(damage):
	current_hp -= damage
	_update_health_bar()
	
	if current_hp <= 0:
		queue_free()
	
func _heal_damage(heal):
	current_hp += heal
	
	if current_hp > max_hp:
		current_hp = max_hp
	
	_update_health_bar()

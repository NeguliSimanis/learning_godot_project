extends Node

var food = 0
@onready var hud = $"../CanvasLayer/HUD"

func _ready():
	print("game started")

func add_food():
	food +=1 
	hud.update_food_label(food)
	print(food)

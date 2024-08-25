extends Control
class_name HUD

@onready var food_label = $FoodLabel

func update_food_label(number:int):
	print("succ")
	food_label.text = "FOOD: " + str(number)

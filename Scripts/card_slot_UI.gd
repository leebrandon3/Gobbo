extends Control

@onready var card_visual: Sprite2D = $MarginContainer/CenterContainer/Panel/Sprite2D
@onready var amount = $Amount


func update(card: Card):
	if !card:
		card_visual.visible = false
	else:
		card_visual.visible = true
		card_visual.texture = card.texture
		amount.text = str(card.amount)
	

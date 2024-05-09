extends Control

@onready var card_visual: Sprite2D = $MarginContainer/CenterContainer/Panel/Sprite2D
@onready var amount = $Amount


func update(slot: CardSlot):
	if !slot:
		card_visual.visible = false
		amount.visible = false
	else:
		card_visual.visible = true
		if slot.card:
			card_visual.texture = slot.card.texture
		amount.visible = true
		amount.text = str(slot.amount)

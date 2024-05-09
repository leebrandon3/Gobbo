extends Resource

class_name Card_Menu

@export var slots: Array[CardSlot]

signal update

func insert(card: Card):
	var card_slots = slots.filter(func(slot): return slot.card == card)
	if !card_slots.is_empty():
		card_slots[0].amount += 1
	else:
		var emptyslots = slots.filter(func(slot): return slot.card == null)
		if !emptyslots.is_empty():
			emptyslots[0].card = card
			emptyslots[0].amount = 1
	update.emit()

extends Resource

class_name Card_Menu

@export var cards: Array[Card]

func insert(card):
	var card_exists = false
	for i in cards:
		if cards[i].name.contains(card.name):
			cards[i].amount += 1
			card_exists = true
			break
	if card_exists == false:
		cards.append(card)
		

extends Resource

class_name Card_Menu

@export var cards: Array[Card]

func insert(card):
	cards.append(card)
	print("add card")
	print(cards)

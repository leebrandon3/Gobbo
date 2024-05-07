extends Node2D

@onready var gobbo = get_node('/root/World/Gobbo')

func speed_up ():
	gobbo.SPEED +=5
	

#needs to add the card png into the scene to represent the crad 

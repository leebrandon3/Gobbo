extends Node2D

@onready var gobbo = get_node('/root/World/Gobbo')

func speed_up ():
	gobbo.SPEED +=5
	



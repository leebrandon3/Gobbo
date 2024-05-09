extends ProgressBar

@onready var gobbo = $"../.."

func _on_gobbo_health_updated():
	value = gobbo.current_health * 100 / gobbo.MAX_HEALTH
	#print(value)

extends Area2D

func _ready() -> void:
	# Подключаем встроенный сигнал Area2D, который срабатывает, когда в него заходит тело (персонаж)
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	# Проверяем, что в зону зашел именно наш игрок, а не другой объект
	if body is CharacterBody2D:
		# Отправляем глобальный сигнал, что гриб собран
		Global.item_collected.emit("mushrooms")
		# Удаляем гриб со сцены
		queue_free()
		

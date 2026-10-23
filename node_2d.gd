extends CharacterBody2D

var speed = 40
@export var anim: AnimatedSprite2D

# Флаг для sit (из вашего туториала)
var is_sitting = false

# Функция мониторит всё, что нажал игрок (из вашего туториала)
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"): # По умолчанию это Пробел или Enter
		if is_sitting:
			is_sitting = false
			anim.play("idle")
		else:
			is_sitting = true
			anim.play("sit")

func _physics_process(_delta):
	# Отмена расчета движения и тд, если игрок сидит (из вашего туториала)
	if is_sitting:
		velocity = Vector2.ZERO
		move_and_slide()
		return

	# Дальше идет ваш прежний код ходьбы
	var input = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)
	
	velocity = input.normalized() * speed

	# Поворот спрайта
	if input.x > 0:
		anim.flip_h = true
	elif input.x < 0:
		anim.flip_h = false

	# Переключение анимаций ходьбы
	if input != Vector2.ZERO:
		anim.play("walk")
	else:
		anim.play("idle")

	move_and_slide()
	$Label.text = Global.player_name

extends Control

@onready var line_edit: LineEdit = $LineEdit
@onready var button: Button = $Button

func _ready() -> void:
	# Подключаем нажатие кнопки к нашей функции проверки
	button.pressed.connect(_on_button_pressed)

func _on_button_pressed() -> void:
	# Берем текст из поля ввода и убираем случайные пробелы по бокам
	var entered_name = line_edit.text.strip_edges()
	
	# Проверяем условие из задания: имя должно быть больше 2 символов
	if entered_name.length() <= 2:
		# Если имя слишком короткое, выведем предупреждение прямо в поле ввода
		line_edit.text = ""
		line_edit.placeholder_text = "Имя слишком короткое! (Мин. 3 знака)"
	else:
		# Если всё отлично — сохраняем имя в наш Global
		Global.player_name = entered_name
		# Переключаем сцену на игровой уровень с грибами
		get_tree().change_scene_to_file("res://node__2d.tscn")

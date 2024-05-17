class_name PasswordPuzzleLetter extends VBoxContainer

@onready var up_btn: Button = %UpBtn
@onready var letter: Label = %Letter
@onready var down_btn: Button = %DownBtn

signal letter_changed

var letters = ["a", "b", "c", "d", "e", "f", "g"]
var current_letter_index = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	letter.text = letters[current_letter_index]


func get_current_letter() -> String:
	return letters[current_letter_index]


func _on_up_btn_pressed() -> void:
	current_letter_index += 1

	if current_letter_index < letters.size():
		letter.text = letters[current_letter_index]
	else:
		current_letter_index = 0
		letter.text = letters[current_letter_index]
	letter_changed.emit()


func _on_down_btn_pressed() -> void:
	current_letter_index -= 1

	if current_letter_index >= 0:
		letter.text = letters[current_letter_index]
	else:
		current_letter_index = letters.size() - 1
		letter.text = letters[current_letter_index]
	letter_changed.emit()

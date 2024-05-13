class_name PasswordPuzzle extends Control

@export var word_to_guess: String = "ABC"

signal puzzle_solved

@onready var l1: PasswordPuzzleLetter = %PasswordPuzzleLetter1
@onready var l2: PasswordPuzzleLetter = %PasswordPuzzleLetter2
@onready var l3: PasswordPuzzleLetter = %PasswordPuzzleLetter3


func _on_letter_changed():
	# check if all 3 letters match
	var current_word = l1.get_current_letter() + l2.get_current_letter() + l3.get_current_letter()
	print(current_word)
	if current_word.to_upper() == word_to_guess.to_upper():
		print("word is correct")
		puzzle_solved.emit()


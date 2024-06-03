extends Node



# Dictionary of recipes
var recipes = {
	"Fruit Salad": {
		"1": "peel apples, kiwis",
		"2": "dice apples, strawberries, kiwis",
		"3": "mix fruits and serve"
	},
	"Fruit Smoothie": {
		"1": "peel kiwis",
		"2": "chop strawberries, and kiwis",
		"3": "put fruits in juicer and shake well",

	},
	"Vegetable Salad": {
		"1": "peel carrots, potatoes",
		"2": "dice carrots, capsicum, and potatoes",
		"3": "boil potatoes",
		"4": "mix vegetables and serve"
	},
	# Add other recipes similarly...
	"French Fries": {
		"1": "peel potatoes",
		"2": "chop potatoes",
		"3": "soak  potatoes in cold water",
		"4": "deep fry potatoes",
	},
	"Baked Potatoes": {
		"1": "Cut potatoes in half",
		"2": "sprinkle salt and soil on potatoes",
		"3": "bake potatoes",

	},
	"Vegetable Soup": {
		"1": "peel carrots",
		"2": "dice carrots and capsicum",
		"3": "boil vegetables",
		"4": "mix corns with vegetables"
	},
	"Carrot Pudding": {
		"1": "peel carrots",
		"2": "chop carrots really well",
		"3": "grind carrots well",
		"4": "fry ground carrots",
		"5": "add cream and salt with carrots",
		"6": "cook until it thickens",

	}
}


var chosenDish=""


var cookingScore=0.0

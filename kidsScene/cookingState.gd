extends Node



# Dictionary of recipes
var recipes_en={
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
		"2": "sprinkle salt  on potatoes",
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
		"5": "mix cream and salt with carrots",
		"6": "cook until it thickens",

	}
}

var recipes_es = {
	"Fruit Salad": {
		"1": "pelar manzanas, kiwis",
		"2": "manzanas, fresas y kiwis en dados",
		"3": "mezclar frutas y servir"	},
	"Fruit Smoothie": {
		"1": "pelar kiwis",
		"2": "picar fresas y kiwis",
		"3": "poner frutas en el exprimidor y agitar bien",
	},
	"Vegetable Salad": {
		"1": "pelar zanahorias, patatas",
		"2": "zanahorias, pimientos y patatas en dados",
		"3": "hervir patatas",
		"4": "mezclar verduras y servir"	},
	# Add other recipes similarly...
	"French Fries": {
		"1": "pelar patatas",
		"2": "picar patatas",
		"3": "remojar las patatas en agua fría",
		"4": "patatas fritas",	
		},
	"Baked Potatoes": {
		"1": "picar patatas",
		"2": "espolvorear sal sobre las patatas",
		"4": "hornear patatas",
	},
	"Vegetable Soup": {
		"1": "pelar zanahorias",
		"2": "zanahorias y pimiento en dados",
		"3": "hervir verduras",
		"4": "mezclar callos con verduras"	},
	"Carrot Pudding": {
		"1": "pelar zanahorias",
		"2": "picar muy bien las zanahorias",
		"3": "moler bien las zanahorias",
		"4": "freír zanahorias molidas",
		"5": "mezclar nata y sal con zanahorias",
		"6": "cocinar hasta que espese",
	}
}
var recipes_dk = {
	"Fruit Salad": {
		"1": "skræl æbler, kiwier",
		"2": "terninger æbler, jordbær og kiwier",
		"3": "mix frugter og server" 
	},
	"Fruit Smoothie": {
		"1": "skræl kiwier",
		"2": "hak jordbær og kiwi",
		"3": "kom frugter i juiceren og ryst godt",	
	},
	"Vegetable Salad": {
		"1": "skræl gulerødder, kartofler",
		"2": "terninger gulerødder, peberfrugt og kartofler",
		"3": "koge kartofler",
		"4": "mix grøntsager og server"
	 },	# Add other recipes similarly...
	"French Fries": {
		"1": "skræl kartofler",
		"2": "hak kartofler",
		"3": "udblød kartoflerne i koldt vand",
		"4": "steg kartoflerne",
	},
	"Baked Potatoes": {
		"1": "hak kartofler",
		"2": "drysse salt på kartoflerne",
		"4": "bage kartofler",
	},
	"Vegetable Soup": {
		"1": "skræl gulerødder",
		"2": "terninger gulerødder og peber",
		"3": "koge grøntsager",
		"4": "mix indmad med grøntsager"
	 },
	"Carrot Pudding": {
		"1": "skræl gulerødder",
		"2": "hak gulerødderne meget godt",
		"3": "slibe gulerødderne godt",
		"4": "steg malede gulerødder",
		"5": "mix fløde og salt med gulerødder",
		"6": "koge indtil det er tyknet",
	}
}

var chosenDish=""


var cookingScore=0.0

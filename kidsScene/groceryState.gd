extends Node
var groceryList = [{}]

var groceryItems = [
	{"id": "0", "expiry_date": "", "price": 0.89, "sale": "0", "path": "res://thesisProjectAssets/groceryItems/40kgcarrot.PNG", "name": "40g carrots", "weight": 5},
	{"id": "1", "expiry_date": "", "price": 2, "sale": "50", "path": "res://thesisProjectAssets/groceryItems/1kgCarrot.PNG", "name": "1kg carrots", "weight": 20},
	{"id": "2", "expiry_date": "", "price": 2, "sale": "0", "path": "res://thesisProjectAssets/groceryItems/36gcapsicum.PNG", "name": "36g capsicum", "weight": 3},
	{"id": "3", "expiry_date": "", "price": 2, "sale": "0", "path": "res://thesisProjectAssets/groceryItems/1kgcapsicum.PNG", "name": "1kg capsicum", "weight": 10},
	{"id": "4", "expiry_date": "", "price": 2, "sale": "0", "path": "res://thesisProjectAssets/groceryItems/12potatoes.PNG", "name": "12 potatoes", "weight": 25},
	{"id": "5", "expiry_date": "", "price": 3, "sale": 0, "path": "res://thesisProjectAssets/groceryItems/halfPotato.PNG", "name": "6 potatoes", "weight": 15},
	{"id": "6", "expiry_date": "", "price": 2, "sale": "0", "path": "res://thesisProjectAssets/groceryItems/2corns.PNG", "name": "2 corn barns", "weight": 10},
	{"id": "7", "expiry_date": "", "price": 2, "sale": "0", "path": "res://thesisProjectAssets/groceryItems/sweetcorn.PNG", "name": "75g sweet corn", "weight": 36},
	{"id": "8", "expiry_date": "", "price": 2, "sale": "0", "path": "res://thesisProjectAssets/groceryItems/kiwis.PNG", "name": "20g kiwis", "weight": 8},
	{"id": "9", "expiry_date": "", "price": 2, "sale": "0", "path": "res://thesisProjectAssets/groceryItems/1kgkiwis.PNG", "name": "1kg kiwis", "weight": 20},
	{"id": "10", "expiry_date": "", "price": 2, "sale": "0", "path": "res://thesisProjectAssets/groceryItems/20gstrawberries.PNG", "name": "20g strawberries", "weight": 7},
	{"id": "11", "expiry_date": "", "price": 2, "sale": "0", "path": "res://thesisProjectAssets/groceryItems/1kgstrawberries.PNG", "name": "1kg strawberries", "weight": 20},
	{"id": "12", "expiry_date": "", "price": 2, "sale": "0", "path": "res://thesisProjectAssets/groceryItems/1kgmangoes.png", "name": "1kg mangoes", "weight": 90},
	{"id": "13", "expiry_date": "", "price": 2, "sale": "0", "path": "res://thesisProjectAssets/groceryItems/360mangoes.png", "name": "36g mangoes", "weight": 20},
	{"id": "14", "expiry_date": "", "price": 2, "sale": "0", "path": "res://thesisProjectAssets/groceryItems/12apples.PNG", "name": "12 apples", "weight": 30},
	{"id": "15", "expiry_date": "", "price": 2, "sale": "0", "path": "res://thesisProjectAssets/groceryItems/20gApples.png", "name": "6 apples", "weight": 15}
]

func _init():
	randomize()  # Ensure the random number generator is seeded

	for i in range(groceryItems.size()):
		groceryItems[i]["expiry_date"] = generate_expiry_date()
func generate_expiry_date():
	var today = int(Time.get_unix_time_from_system())  # Get the current time in seconds
	var random_days = randi_range(-365, 365)  # Randomly add/subtract up to one year
	var expiry_timestamp = today + random_days * 24 * 60 * 60  # Convert days to seconds
	var expiry_date = Time.get_datetime_dict_from_unix_time(expiry_timestamp)
	return str(expiry_date.day).pad_zeros(2) + "/" + str(expiry_date.month).pad_zeros(2) + "/" + str(expiry_date.year)

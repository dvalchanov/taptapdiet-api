json.meal do
		json.id @meal.id
		json.title @meal.title
		json.image @meal.image
		json.created_at @meal.created_at
		json.ingredients @meal.ingredients
end
json.days(@days) do |day|
	json.id day.id
	json.created_at day.created_at
	json.rating day.average_rating

	json.meals(day.meals) do |meal|
		json.id meal.id
		json.title meal.title
		json.image meal.image
		json.created_at meal.created_at
		json.ingredients meal.ingredients
	end
end
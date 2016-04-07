json.days(@days) do |day|
	json.id day.id
	json.created_at day.created_at
end
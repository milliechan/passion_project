20.times do
	User.create(full_name: Faker::Name.name, 
				username: Faker::App.name + rand(1..9999).to_s, 
				email: Faker::Internet.email + rand(1..9999).to_s, 
				password_hash: Faker::Internet.password)
end

50.times do
	Post.create(description: Faker::Lorem.sentence(4),
				author_id: rand(1..20))
end

5.times do
	Follow.create(user_id: rand(1..20), 
				celebrity_id: rand(1..20))
end

# hashtag 
50.times do 
	Hashtag.create(tag: Faker::StarWars.specie)
	Hashtag.create(tag: Faker::Pokemon.name)
end

# hashpost 
10.times do 
	Hashpost.create(hash_id: rand(1..50),
					post_id: rand(1..50))
end
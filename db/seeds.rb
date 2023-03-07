# Erasing previous records
puts "Deleting old data..."
Project.destroy_all
User.destroy_all
Skill.destroy_all


puts "Seeding tables..."

9.times do

    user = User.create(
        "name": Faker::Name.name,
        "email": Faker::Internet.email,
        "password_hash": Faker::Alphanumeric.alphanumeric(number: 10),
     
    )
    rand(1..6).times do
        Project.create(
        "title": Faker::Marketing.buzzwords ,
        "description": Faker::Lorem.sentence,
        "user_id": user.id,
        "status": rand(0..3)
    )
    end

    # rand(1..5).times do
    #     Skill.create(
    #         "name": Faker::Job.key_skill, 
    #         "user_id": user.id
    #     )
    # end

end

puts "Creating skills"
    skill1 = Skill.create(name: "React")
    skill2 = Skill.create(name: "Ruby")
    skill3 = Skill.create(name: "JavaScript")
    skill4 = Skill.create(name: "SQLs")
    skill5 = Skill.create(name: "Python")

puts "Done seeding"
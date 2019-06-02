# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)



def create_employees(names)
    messages = ['Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Praesent quis mollis velit, vitae maximus arcu.', '', 'Phasellus a magna ut turpis consequat accumsan.', 'Aliquam sit amet nibh dolor.', '', 'Duis quis tincidunt metus.', 'Aenean elit ligula, gravida eu aliquam volutpat, ullamcorper in purus.', 'Vestibulum magna mi, tempus at condimentum ac, rhoncus ut urna.', '', 'Aenean et blandit felis. Quisque facilisis nibh eget porta eleifend.', 'Nam pellentesque elit at neque fringilla aliquet.']
    employees = []
    names.each do |name|
        email = name.downcase.split.join('.') + '@email.org'
        user = User.create!(email: email, password: '123123123')
        employees << Employee.create!(full_name: name, user: user)
    end
    for i in 0..15 do 
        from_index = rand(0..4)
        to_index = rand(0..4)
        days_ago = rand(1..260)
        message_no = rand(0..11)
        if(from_index != to_index) then 
            Kudo.create(from: employees[from_index], to: employees[to_index], message: messages[message_no], created_at: days_ago.days.ago)
        end
    end
end

if(Apartment::Tenant.current == 'development') then 
    unless Organization.any? then 
        @organization1 = Organization.create!(name: 'Dragon records', subdomain: 'dragon')
        Apartment::Tenant.create('dragon')
        @organization2 = Organization.create!(name: 'Dinosaur softwares', subdomain: 'dinosaur')
        Apartment::Tenant.create('dinosaur')
        @organization3 = Organization.create!(name: 'Titanium foods', subdomain: 'titanium')
        Apartment::Tenant.create('titanium')
    end
else 
    unless Employee.any? then 
        names = []
        case Apartment::Tenant.current
        when 'dragon'
            names = ['Gemma Noris', 'Michelle Gobble', 'Tony MacDonald', 'Una Pitt', 'Tom Butterscotch']
        when 'dinosaur'
            names = ['Zahra Strickland', 'Lucie Mejia', 'Eloise Palmer', 'Paula Alexander', 'Marie Mann']
        when 'titanium'
            names = ['Marshall Potter', 'Lewis Vinson', 'Lydia Bird', 'Ammaarah Gordon', 'Niam Trujillo']
        end
        create_employees(names)
    end
end

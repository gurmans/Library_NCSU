# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

    a = Admin.new(:name => 'jpg', :email => 'jpg@gmail.com', :password => 'jpg123', :password_confirmation => 'jpg123');
    a.save!
    p = Program.new(:name => 'Undergraduate', :maxNumberOfBooksIssuable => 2)
    p.save!
    p = Program.new(:name => 'Masters', :maxNumberOfBooksIssuable => 4)
    p.save!
    p = Program.new(:name => 'PhD', :maxNumberOfBooksIssuable => 6)
    p.save!
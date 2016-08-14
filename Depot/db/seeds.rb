# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all
Product.create!(title: 'Harry Potter and the Cursed Child',description: 
    %{<p>
          Harry Potter and the cursed child is a return t the famous 
          series and is the eigth edition in the same. 
      </p>},
    image_url: 'HP.jpg',
    price: 5.00)
Product.create!(title: 'Percy Jackson: Sword of Summer',description: 
    %{<p>
         Rick Riordan returns to the fantasy world with this thriller based on Norse Gods
      </p>},
    image_url: 'PJ.jpg',
    price: 5.12)
Product.create!(title: 'Goosebumps: The Haunted Mask',description: 
    %{<p>
          A halloween mask can cause troubles... Or can it?
      </p>},
    image_url: 'GJ.jpg',
    price: 5.00)
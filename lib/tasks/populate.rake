namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    [Category, Post].each(&:delete_all)
    
    Category.populate 100 do |category|
      category.name = Populator.words(1..3).titleize
      Post.populate 1..100 do |post|
#        post.category_id = category.id
        post.name = Populator.words(1..5).titleize
        post.text = Faker::Lorem.sentence
        
      end
    end
  end
end
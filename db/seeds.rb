# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..10).each do
  Article.create(title: Faker::TwinPeaks.quote, content: Faker::Lorem.paragraph)
end

activities = YAML.load_file("#{Rails.root}/config/activities.yml")

admin_activities =
    activities['article']['view'].map { |a| a['action'] } +
    activities['article']['edit'].map { |a| a['action'] } +
    activities['article']['destroy'].map { |a| a['action'] }

simpleton_activities =
    activities['article']['view'].map { |a| a['action'] }

Role.create(name: 'admin', activities: admin_activities)
Role.create(name: 'simpleton', activities: simpleton_activities)

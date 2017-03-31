# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Article.create(title: 'This is an article', content: 'Hehehehe')
Article.create(title: 'Not is an article', content: 'Hehehehe')
Article.create(title: 'May is an article', content: 'Hehehehe')
Article.create(title: 'Hay is an article', content: 'Hehehehe')
Article.create(title: 'Way is an article', content: 'Hehehehe')
Article.create(title: 'Tey is an article', content: 'Hehehehe')
Article.create(title: 'Wake is an article', content: 'Hehehehe')

admin_activities = [
  'article:index',
  'article:show',
  'article:new',
  'article:edit',
  'article:create',
  'article:update',
  'article:destroy'
]

simpleton_activities = [
  'article:index',
  'article:show'
]

Role.create(name: 'admin', activities: admin_activities)
Role.create(name: 'simpleton', activities: simpleton_activities)

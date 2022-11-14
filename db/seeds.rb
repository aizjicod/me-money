require 'faker'
1.times do
  User.create(name: Faker::Name.name)
end

Group.create(name: 'Arts', icon: '🎨', user_id: 1)
Group.create(name: 'Food', icon: '🍽️', user_id: 1)
Group.create(name: 'Hobbies', icon: '🎞️', user_id: 1)

3.times do |expense|
  Expense.create(name: Faker::Artist.name, amount: rand(99..3333), group_ids: 1, user_id: 1)
  Expense.create(name: Faker::Food.dish, amount: rand(9..33), group_ids: 2, user_id: 1)
  Expense.create(name: Faker::Hobby.activity, amount: rand(99..333), group_ids: 3, user_id: 1)
end


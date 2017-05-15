#Thisfileshould contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
# movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# coding: utf-8


5.times do |no|
  no += 1
  user = User.new(username:"testtarou#{no}", email: "test#{no}@example.com", password: "testtest")
  user.save!
end

3.times do |no|
  no += 1
  Planner.create(user_id: no, gender: '男性' , occupation: '学生' , age: 20 )
end

3.times do |num1|
  num1 += 1
  15.times do |num2|
    num2 += 1
    plan = Plan.create(
      title: "tarou#{num1}-#{num2}",place:'東京',start_date: "2017-10-01 10:00:00",
      end_date: "2017-10-01 20:00:00" ,description: "taroudescription#{num1}-#{num2}",
      start_favorability_rating: 10,end_favorability_rating:50 , status: 1, planner_id: num1
    )
    Comment.create(user_id: num1 , plan_id: plan.id , body: "サンプルサンプルサンプル\nサンプルサンプル")
  end
end

staff = Staff.new(
  name: 'テスト太郎',email: 'test@example.com',email_confirmation: 'test@example.com',
  password: 'testtest',password_confirmation: 'testtest',status: 1)
staff.save!

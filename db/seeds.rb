# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.delete_all
School.delete_all
Course.delete_all
UserSchool.delete_all
UserCourse.delete_all
Post.delete_all
IsTutor.delete_all
Friendship.delete_all


User.create(id: 1, first_name: "Benjamin", last_name: "Caneba", email: "bcaneba@gmail.com", phone: "9062314010", username: "bcaneba", password: "theanswer", tutor: false)

#create a school, add 3 courses to it
School.create(id: 1, name: "Michigan State University", location: "East Lansing", state: "MI")
School.create(id: 2, name: "Minnesota State University", location: "Minneapolis", state: "MN")
School.create(id: 3, name: "Oklahoma State University", location: "Ok City", state: "OK")
School.create(id: 4, name: "Delaware State University", location: "Dover", state: "DE")
School.create(id: 5, name: "Oregon State University", location: "Beaverton", state: "OR")
School.create(id: 6, name: "Detroit State University", location: "Detroit", state: "MI")

Course.create(id: 1, name: "Accounting 101", description: "Basic Accounting principles", school_id: 1)
Course.create(id: 2, name: "Mathematics 301", description: "Advanced Math principles", school_id: 1)
Course.create(id: 3, name: "Engineering 400", description: "Intermediate Engineering principles", school_id: 1)

#make our only user a student of the school we created
UserSchool.create(user_id: 1, school_id: 1)
#make our only user take accounting course
UserCourse.create(user_id: 1, course_id: 1)



# create a post that belongs to our one user
Post.create(title: "First Post", description: "This is the first post", user_id: 1, school_id: 1, course_id: 1)


# make the user into a tutor
@user = User.first
@user.update(tutor: true)
@user.save

# create tutor profile for the user
IsTutor.create(id: 1, rate: 12, description: "I am great at Math!", user_id: 1, course_id: 1)


# find the courses that a user is a tutor of
puts @user.courses.find(1).is_tutors



# create a friendship between the 2 users
User.create(id: 2, first_name: "Benj", last_name: "Cane", email: "bcan@gmail.com", phone: "9064564010", username: "caneba", password: "theanswer", tutor: false)
Friendship.create(user_id: 1, friend_id: 2)












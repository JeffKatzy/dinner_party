# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Dish.destroy_all
Host.destroy_all
Dinner.destroy_all
User.destroy_all
Guest.destroy_all
Invitation.destroy_all
DishAssignment.destroy_all
MenuItem.destroy_all

def make_seeds
  make_dishes
  make_users
  make_guests
  make_hosts
  make_dinners
  make_invitations
  make_dish_assignments
  make_menu_items
end

def make_users
  User.create(name: "Tracy 1")
  User.create(name: "Jessie")
  User.create(name: "Hedi")
  User.create(name: "Dan")
end


def make_hosts
  Host.create(user_id: 1)
  Host.create(user_id: 2)
end

def make_guests
  Guest.create(user_id:1)
  Guest.create(user_id:2)
  Guest.create(user_id:3)
  Guest.create(user_id:1)
end


def make_dinners
  Dinner.create(date: Date.parse("November 2, 2015"), host_id: 1, title: "Titlee")
  Dinner.create(date: Date.parse("November 3, 2015"), host_id: 1, title: "Titlee")
  Dinner.create(date: Date.parse("November 4, 2015"), host_id: 1, title: "Titlee")
  Dinner.create(date: Date.parse("November 5, 2015"), host_id: 1, title: "Titlee")
  Dinner.create(date: Date.parse("November 6, 2015"), host_id: 1, title: "Titlee")
  Dinner.create(date: Date.parse("November 7, 2015"), host_id: 1, title: "Titlee")
end

def make_dishes
  Dish.create(name: "Lasagna", course: "Main Dish")
  Dish.create(name: "Chicken", course: "Main Dish")
  Dish.create(name: "Brisket", course: "Main Dish")
  Dish.create(name: "Pot Pie", course: "Main Dish")
  Dish.create(name: "Pulled Pork", course: "Main Dish")
  Dish.create(name: "Green Salad", course: "Salad")
  Dish.create(name: "Pasta Salad", course: "Salad")
  Dish.create(name: "Chips and Salsa", course: "Appetizer")
  Dish.create(name: "Hummus and Vegetables", course: "Appetizer")
  Dish.create(name: "Spinach Dip", course: "Appetizer")
  Dish.create(name: "Brownies", course: "Dessert")
  Dish.create(name: "Chocolate Chip Cookies", course: "Dessert")
end

def make_invitations
  Invitation.create(dinner_id: 1, guest_id: 1, status: "Attending")
  Invitation.create(dinner_id: 1, guest_id: 2, status: "Attending")
  Invitation.create(dinner_id: 1, guest_id: 3, status: "Attending")
  Invitation.create(dinner_id: 1, guest_id: 4, status: "Attending")
end

def make_dish_assignments
  DishAssignment.create(guest_id: 1, menu_item_id: 1)
end

def make_menu_items
  MenuItem.create(dinner_id: 1, dish_id: 1)
  MenuItem.create(dinner_id: 2, dish_id: 1)
  MenuItem.create(dinner_id: 3, dish_id: 1)
  MenuItem.create(dinner_id: 4, dish_id: 1)
  MenuItem.create(dinner_id: 5, dish_id: 1)
  MenuItem.create(dinner_id: 6, dish_id: 1)
end


make_seeds
# == Schema Information
#
# Table name: menu_items
#
#  id        :integer          not null, primary key
#  dish_id   :integer
#  dinner_id :integer
#

class MenuItem < ActiveRecord::Base
  belongs_to :dish
  belongs_to :dinner
  has_one :dish_assignment, dependent: :destroy

  Dish::COURSES

  def self.existing_menu_ids(dinner_id)
    existing_menu_items = self.where(dinner_id: dinner_id)
    # this if clause will never fail - you need .present?
    if existing_menu_items
      menu_ids = existing_menu_items.map(&:dish).map(&:id)
    end
    # this will be undefined when if clause fails
    menu_ids
  end

  def self.index_by_course(dinner_id)

    Dish::COURSES.map do |course| 
      self.joins(:dish).where(dinner_id: dinner_id, dishes: {course: course})
    end
    # nested array necessary? map necessary?
  end

  def name
    dish.name
  end

end

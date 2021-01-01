require 'action_view'

class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper
  CAT_COLORS =  [
                  "Black",
                  "White",
                  "Calico",
                  "Grey",
                  "Gray",
                  "Orange"
                ]
  
  validates :birth_date, 
            :color, 
            :name, 
            :sex, 
            presence: true

  validates :color, inclusion: CAT_COLORS
  validates :sex,   inclusion: [ "M", "F" ]

  has_many :cat_rental_requests,
      foreign_key: :cat_id,
      class_name: :CatRentalRequest,
      dependent: :destroy

  def age
    time_ago_in_words(birth_date)
  end

  def self.persisted?(cat)
    if cat.nil?
      return false
    else
      return true
    end
  end
end

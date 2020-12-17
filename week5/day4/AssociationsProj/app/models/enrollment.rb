# create_table "enrollments", force: :cascade do |t|
    # t.integer "course_id"
    # t.integer "student_id"
    # t.datetime "created_at", null: false
    # t.datetime "updated_at", null: false

class Enrollment < ApplicationRecord
    #associations from user and course
    belongs_to :user,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: 'User'

    belongs_to :course,
        primary_key: :id,
        foreign_key: :course_id,
        class_name: 'Course'
end

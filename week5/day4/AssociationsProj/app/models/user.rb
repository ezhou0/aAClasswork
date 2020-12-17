# create_table "users", force: :cascade do |t|
#     t.string "name"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false

class User < ApplicationRecord
    #add association for enrollment and enrolled courses
    has_many :enrollments,
        primary_key: :id,
        foreign_key: :student_id,
        class_name: 'Enrollment'
    has_many :enrolled_courses,
        through: :enrollments,
        source: :course

end

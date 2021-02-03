# Use json.extract! to include the guest's name, age, and favorite color. Make sure you don't include created_at or updated_at
# json.extract! @guest, :name, :age, :favorite_color

json.partial! 'guest' , guest: @guest
json.gifts do json.array! @guest.gifts, :title, :description 
end
#json.array! @guests do |guest|
 #   json.name guest.name
  #  json.age guest.age
   # json.favorite_color guest.favorite_color
#end

#json.array! @guest, partial: 'api/guests/guest', as: :guest

json.array! @guests do |guest|
   json.partial! 'api/guests/guest', guest: guest
end

# json.partial! 'api/guests/guest', collection: @guests, as: :guest
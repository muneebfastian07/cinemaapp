class Movie
  include Mongoid::Document
  field :name, type: String
  field :room_name, type: String
end

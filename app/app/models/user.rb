class User
  include Mongoid::Document
  field :screen_name
  field :name
  field :profile_image_url
  embedded_in :tweet, :inverse_of => :user
end
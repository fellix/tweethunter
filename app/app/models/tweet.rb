class Tweet
  include Mongoid::Document
  embedded_in :hunter, :inverse_of => :tweets
  field :text
  embeds_one :user
end

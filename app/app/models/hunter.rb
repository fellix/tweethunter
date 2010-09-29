class Hunter
  include Mongoid::Document
  field :th_tag
  embeds_many :tweets
end

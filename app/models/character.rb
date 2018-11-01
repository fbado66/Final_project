class Character < ApplicationRecord
  # belongs_to :user
  # optional, but probably a good idea
  # validates :external_id, :uniqueness => true

  # has_many :posts
  belongs_to :user

end
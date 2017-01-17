class Page < ApplicationRecord
  validates :facebook_id, uniqueness: true

  has_many :events
end

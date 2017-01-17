class Event < ApplicationRecord
  validates :facebook_id, uniqueness: true

  belongs_to :page
end

class Event < ApplicationRecord
  validates :facebook_id, uniqueness: true
end

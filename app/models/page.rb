class Page < ApplicationRecord
  validates :facebook_id, uniqueness: true
end

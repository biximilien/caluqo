require 'facebook'

class Page < ApplicationRecord

  attr_accessor :facebook_page

  after_initialize -> { self.facebook_page = Facebook::Page.new(self.facebook_id) }

  validates :facebook_id, uniqueness: true

  has_many :events

  delegate :import_all_events, to: :facebook_page

end

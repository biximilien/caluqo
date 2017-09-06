require 'facebook'

class Page < ApplicationRecord

  attr_accessor :facebook_page

  after_initialize -> { self.facebook_page = Facebook::Page.new(self.facebook_id, self.id) }

  validates :facebook_id, uniqueness: true

  has_many :events

  delegate :import_all_events, :update_all_events, to: :facebook_page

  def abbreviation
    return name.truncate(10) if self[:abbreviation].nil? || self.abbreviation.empty?
    super
  end

end

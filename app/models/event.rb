class Event < ApplicationRecord
  validates :facebook_id, uniqueness: true

  belongs_to :page

  scope :month, -> (month) do
    month = Date.parse(month) unless month.kind_of?(Date) || month.kind_of?(Time)
    where(started_at: month.beginning_of_month..month.end_of_month )
  end

end

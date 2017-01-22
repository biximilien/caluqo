describe Event, type: :model do
  it { should belong_to :page }

  it { should validate_uniqueness_of :facebook_id }
end

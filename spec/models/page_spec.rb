describe Page, type: :model do
  it { should have_many :events }
  
  it { should validate_uniqueness_of :facebook_id }
end

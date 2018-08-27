require 'rails_helper'

describe Comment, type: :model do 
  describe "Validations" do 
    it {should validate_presence_of(:content)}
    it {should validate_presence_of(:created_at)}
    it {should validate_presence_of(:updated_at)}
  end
 describe "Relationship" do 
   it {should belong_to(:job)}
 end 
end 
require 'rails_helper'

describe Comment, type: :model do 
  describe "Validations" do 
    it {should validate_presence_of(:content)}
  end
  
  describe "Relationship" do 
   it {should belong_to(:job)}
  end 
end 
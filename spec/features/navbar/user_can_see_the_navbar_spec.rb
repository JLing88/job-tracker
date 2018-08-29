require 'rails_helper'

describe 'user can see a navbar on on all pages' do
  describe 'As a user' do
    it 'displays navbar at the top of the page' do
      visit dashboard_path

      within("#navbar") do
        expect(page).to have_content("Dashboard")
      end
      within("#navbar") do
        expect(page).to have_content("Categories")
      end
      within("#navbar") do
        expect(page).to have_content("Companies")
      end
      within("#navbar") do
        expect(page).to have_content("Jobs")
      end


    end
  end
end

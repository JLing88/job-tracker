require 'rails_helper'

describe 'user creates a contact' do
  context 'as a user' do
    it 'they successfully create a contact' do
      company = Company.create!(name: "SDOEIJESI")

      visit company_path(company)

      click_link "Create New Contact"

      expect(current_path).to eq(new_company_contact_path(company))

      name = "Jesse Ling"
      job = "CTO"
      email = "jling@mail.com"

      fill_in 'contact[name]', with: name
      fill_in 'contact[job]', with: job
      fill_in 'contact[email]', with: email
      click_on "Create Contact"

      expect(current_path).to eq(company_path(company))
      expect(page).to have_content("Contact Added")
      expect(page).to have_content(name)
      expect(page).to have_content(job)
      expect(page).to have_content(email)
    end
  end
end

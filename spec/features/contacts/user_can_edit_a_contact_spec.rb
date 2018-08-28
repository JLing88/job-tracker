require 'rails_helper'

describe 'user can edit a contact' do
  describe 'they visit a company show page' do
    describe 'they click the edit link' do
      it 'should edit the contact' do
        name = "Bob Jones"
        job = "CEO"
        email = "bjones@mail.com"
        company = Company.create!(name: "Google")
        contact = company.contacts.create!(name: "Jesse Ling", job: "CTO", email: "jling@mail.com")

        visit company_path(company)
        expect(current_path).to eq(company_path(company))

        click_on "Edit"

        expect(current_path).to eq(edit_company_contact_path(company, contact))

        fill_in "contact[name]", with: name
        fill_in "contact[job]", with: job
        fill_in "contact[email]", with: email

        click_on "Update Contact"

        expect(current_path).to eq(company_path(company))
        expect(page).to have_content(name)
        expect(page).to have_content(job)
        expect(page).to have_content(email)
      end
    end
  end
end

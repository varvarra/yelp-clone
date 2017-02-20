require 'rails_helper'

feature 'restaurants' do
  context 'no restaurants have been added' do
    scenario 'should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a restaurant'
    end
  end

  context 'restaurants have been added' do
    before do
      Restaurant.create(name: 'Los Pollos Hermanos')
    end

    scenario 'display restaurants' do
      visit '/restaurants'
      expect(page).to have_content 'Los Pollos Hermanos'
      expect(page).not_to have_content 'No restaurants yet'
    end
  end

  context "creating restaurants" do
    scenario "prompts user to fill in a form, then displays a restaurant" do
      visit "/restaurants"
      click_link "Add a restaurant"
      fill_in "Name", with: 'Los Pollos Hermanos'
      click_button "Create Restaurant"
      expect(page).to have_content 'Los Pollos Hermanos'
      expect(current_path).to eq "/restaurants"
    end
  end
end

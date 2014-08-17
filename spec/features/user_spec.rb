require "rails_helper"

feature "As a user" do
  before(:each) do
    @subboard = FactoryGirl.build(:subboard)
    @user = FactoryGirl.create(:user)
    sign_in(@user)
  end

  scenario "I can sign out" do
    visit root_path

    click_link "Sign Out"

    expect(page).to_not have_content(@user.email)
  end

  scenario "I can create a subboard" do

    visit root_path

    click_link "New Subboard"

    expect(page).to have_selector("form")

    fill_in "Name", with: @subboard.name
    fill_in "Description", with: @subboard.description

    click_button "Create Subboard"

    expect(Subboard.find_by(name: @subboard.name).name).to eq(@subboard.name)
    expect(page).to have_content(@subboard.name)
    expect(page).to have_content(@subboard.description)
    expect(page.current_path).to have_text("/s/#{@subboard.slug}")
  end
end

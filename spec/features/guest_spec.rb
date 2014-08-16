require "rails_helper"

feature "As a guest" do
  scenario "I can sign up" do
    visit "/"

    click_link "Sign Up"

    fill_in "Email", with: "wombat@example.com"
    fill_in "Password", with: "password"
    click_button "Sign Up"

    expect(User.first.email).to eq("wombat@example.com")
    expect(page).to have_content("wombat@example.com")
  end
end

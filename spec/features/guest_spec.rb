require "rails_helper"

feature "As a guest" do
  scenario "I can sign up" do
    visit root_path

    click_link "Sign Up"

    fill_in "Email", with: "wombat@example.com"
    fill_in "Password", with: "password"
    click_button "Sign Up"

    expect(User.find_by(email: "wombat@example.com").email).to eq("wombat@example.com")
    expect(page).to have_content("wombat@example.com")
  end

  scenario "I can sign in" do
    user = FactoryGirl.create(:user)
    visit root_path

    click_link "Sign In"

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password_digest
    click_button "Sign In"

    expect(page.current_path).to eq(root_path)
    expect(page).to have_content(user.email)
  end
end

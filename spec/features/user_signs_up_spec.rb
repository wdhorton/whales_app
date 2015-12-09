RSpec.feature "Signing Up" do
  scenario "with correct credentials" do
    visit '/users/new'

    fill_in 'Username', :with => 'new_user', visible: false
    fill_in 'Password', :with => 'password', visible: false

    click_button 'Sign Up'
    expect(page).to have_content 'Whales Blog'
  end
end

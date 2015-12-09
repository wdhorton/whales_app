require_relative '../../app/models/user'

RSpec.feature "Signing In" do
  background do
    user = User.new(username: 'example_user', password: 'password')
    user.save
  end

  scenario "with correct credentials" do
    visit '/session/new'

    fill_in 'Username', :with => 'example_user', visible: false
    fill_in 'Password', :with => 'password', visible: false

    click_button 'Sign In'
    expect(page).to have_content 'Whales Blog'
  end
end

RSpec.feature "Logging Out" do
  scenario do
    visit '/users/new'
    fill_in 'Username', :with => 'new_user', visible: false
    fill_in 'Password', :with => 'password', visible: false
    click_button 'Sign Up'

    click_button 'Log out'

    expect(page).to have_content 'Sign In!'
  end
end

RSpec.feature "Making new post" do
  scenario do
    visit '/users/new'
    fill_in 'Username', with: 'new_user', visible: false
    fill_in 'Password', with: 'password', visible: false
    click_button 'Sign Up'

    click_link "New Post"
    fill_in "Title", with: "A title for my post"
    fill_in "Body", with: "Some body text"

    click_button "Submit"
    expect(page).to have_content 'A title for my post'
  end
end

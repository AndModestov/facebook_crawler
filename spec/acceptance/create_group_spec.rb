require 'rails_helper'

feature 'Create group' do
  background do
    visit groups_path
    click_on 'New group request'
    fill_in 'Name', with: 'New group name'
  end

  scenario 'user tries to create group' do
    fill_in 'Url', with: 'http://example.com'
    click_on 'Submit'

    expect(page).to have_content 'Group was successfully created.'
    expect(page).to have_content 'New group name'
    expect(page).to have_link 'http://example.com'
  end

  scenario 'user tries to create invalid group' do
    click_on 'Submit'

    expect(page).to_not have_content 'New group name'
    expect(page).to_not have_link 'http://example.com'
    expect(page).to have_content 'Group could not be created.'
  end
end

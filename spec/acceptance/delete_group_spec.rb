require 'rails_helper'
Capybara.javascript_driver = :webkit

feature 'Destroy group' do
  given!(:group){ create(:group) }

  scenario 'user visit group_path', js: true do
    visit groups_path
    save_and_open_page
    expect(page).to have_content group.name
    expect(page).to have_content group.url

    click_on 'delete'

    expect(page).to_not have_content group.name
    expect(page).to_not have_content group.url
    expect(page).to have_content 'Succecessfully deleted'
  end
end
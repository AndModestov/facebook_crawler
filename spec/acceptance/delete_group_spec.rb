require 'rails_helper'

feature 'Destroy group' do
  given!(:group){ create(:group) }

  scenario 'user visit group_path' do
    visit groups_path
    expect(page).to have_content group.name
    expect(page).to have_content group.url

    click_on 'delete'

    expect(page).to_not have_content group.name
    expect(page).to_not have_content group.url
    expect(page).to have_content 'Group was successfully destroyed.'
  end
end
require 'rails_helper'

feature 'Show group' do
  given!(:group){ create(:group) }

  scenario 'user visit group_path' do
    visit group_path(group)

    expect(page).to have_content group.name
    expect(page).to have_link group.url, href: group.url
  end
end
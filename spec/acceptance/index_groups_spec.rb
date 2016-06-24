require 'rails_helper'

feature 'Index groups' do
  given!(:groups){ create_list(:group, 2) }

  scenario 'user visit groups index' do
    visit groups_path

    groups.each do |group|
      expect(page).to have_content group.name
      expect(page).to have_content group.url
      expect(page).to have_link('delete', href: group_path(group))
    end

    expect(page).to have_link('New group request', href: new_group_path )
  end
end
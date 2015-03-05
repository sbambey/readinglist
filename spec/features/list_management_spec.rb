require "rails_helper"

RSpec.feature "List management", :type => :feature do
	scenario "Viewing index" do
		list = create(:list)
		another_list = create(:list, title: "AnotherTitle")

		visit lists_path

		expect(page).to have_content(list.title)
		expect(page).to have_content(another_list.title)
	end

  scenario "Creating a list" do
  	list_title = "My Title"
  	list_item_name = "List Item name"

    visit root_path

    click_link "Create a list"

    fill_in "List Title", with: list_title
    fill_in "Name", with: list_item_name
    click_button "Create list"

    expect(page).to have_content("List was successfully created.")
    expect(page).to have_content(list_title)
    expect(page).to have_content(list_item_name)
  end
end
require "rails_helper"

RSpec.feature "List management", :type => :feature do
	scenario "#index" do
		list = create(:list)
		another_list = create(:list, name: "AnotherTitle")

		visit lists_path

		expect(page).to have_content(list.name)
		expect(page).to have_content(another_list.name)
	end

  scenario "#new" do
  	list = build(:list)

    visit root_path

    click_link "Create a list"

    expect(page).to have_link("Add Book Title")

    #expect(page).to have_css(".book-input", count: 2)

    fill_in "List Name", with: list.name
    fill_in "List Description", with: list.description

    # Problems with external API call
    click_button "Create list"

    expect(page).to have_content(list.name)
    expect(page).to have_content(list.description)
  end

  scenario "#show" do
    list = create(:list)
    list_item = create(:list_item, list: list)

    visit list_path(list)

    within(".list-heading") do
      expect(page).to have_content(list.name)
      expect(page).to have_content(list.description)
    end

    expect(page).to have_content(list_item.title)
    expect(page).to have_content(list_item.author)
    expect(page).to have_content(list_item.categories)
  end
end
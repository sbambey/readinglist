# == Schema Information
#
# Table name: lists
#
#  id          :integer          not null, primary key
#  name        :text
#  description :text
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  slug        :string
#

require 'rails_helper'

RSpec.describe List, type: :model do
  let(:list) { build(:list) }
  subject { list }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:list_items) }
  context "destroying a list" do
		it "destroys dependent records" do
			list.save
			list_item = create(:list_item, list: list)
			expect{list.destroy}.to change(ListItem, :count).by(-1)
		end
	end
	it { is_expected.to have_one(:short_url) }

  it { is_expected.to accept_nested_attributes_for(:list_items) }

  it { is_expected.to validate_presence_of(:name) }

  it { is_expected.to validate_length_of(:name).is_at_least(3).is_at_most(80) }

  describe "searching lists" do
  	context "when given a search term" do
  		it "multisearches them" do
		  	pgsearch = double()
		  	allow(List).to receive(:search_service) { pgsearch }

		  	expect(pgsearch).to receive(:multisearch)

		  	List.search("q")
		  end
		end

		context "when not given a search term" do
			it "returns an ordered scope" do
				expect(List).to receive(:order)

				List.search("")
			end
		end
  end
end

require 'rails_helper'

RSpec.describe List, type: :model do
  let(:list) { build(:list) }
  subject { list }

  it { is_expected.to have_many(:list_items) }
  context "destroying a list" do
		it "destroys dependent records" do
			list.save
			list_item = create(:list_item, list: list)
			expect{list.destroy}.to change(ListItem, :count).by(-1)
		end
	end

  it { is_expected.to accept_nested_attributes_for(:list_items) }

  it { is_expected.to validate_presence_of(:name) }

  
end

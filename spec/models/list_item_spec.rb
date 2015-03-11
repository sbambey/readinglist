require 'rails_helper'

RSpec.describe ListItem, type: :model do
  let(:item) { build(:list_item) }
  subject { item }

  it { is_expected.to belong_to(:list) }

  it { is_expected.to validate_presence_of(:title) }
end

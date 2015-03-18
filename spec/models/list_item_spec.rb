# == Schema Information
#
# Table name: list_items
#
#  id            :integer          not null, primary key
#  title         :text
#  author        :text
#  isbn          :string
#  is_ebook      :boolean
#  website       :text
#  image_link    :text
#  categories    :text
#  list_id       :integer
#  personal_note :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  amazon_link   :text
#

require 'rails_helper'

RSpec.describe ListItem, type: :model do
  let(:item) { build(:list_item) }
  subject { item }

  it { is_expected.to belong_to(:list) }

  it { is_expected.to validate_presence_of(:title) }
end

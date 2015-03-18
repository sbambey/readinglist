# == Schema Information
#
# Table name: short_urls
#
#  id         :integer          not null, primary key
#  slug       :string
#  list_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe ShortUrl, type: :model do
	let(:short_url) { build(:short_url) }
	subject { short_url }

	it { is_expected.to belong_to(:list) }

	describe "#short_url" do
		it { expect(short_url.short_url).to_not be_nil }
	end
end

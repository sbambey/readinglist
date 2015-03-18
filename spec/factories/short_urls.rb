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

FactoryGirl.define do
  factory :short_url do
		list
  end
end

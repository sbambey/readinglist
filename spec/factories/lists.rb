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

FactoryGirl.define do
  factory :list do
    name "MyName"
    description "Some Description"
    user
  end
end

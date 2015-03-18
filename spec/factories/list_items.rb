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

FactoryGirl.define do
  factory :list_item do
  	title "Sample title"
  	author "Sample Author"
    isbn "9780486600611"
    is_ebook false
    website "http://www.samplesite.com"
    image_link "http://www.somesite.com/test.png"
    categories "Computers"
    list
    personal_note "I really like this book"
    amazon_link "http://www.amazon.com"
  end
end

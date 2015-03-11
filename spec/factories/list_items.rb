FactoryGirl.define do
  factory :list_item do
  	author "Sample Author"
    title "MyText"
    is_ebook false
    website "http://www.samplesite.com"
    categories "Computers"
    list
  end
end

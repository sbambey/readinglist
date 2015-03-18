FactoryGirl.define do
  factory :book_request do
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
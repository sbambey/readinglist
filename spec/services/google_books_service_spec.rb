require 'rails_helper'

RSpec.describe GoogleBooksService do
  let(:service) { GoogleBooksService.new({title: "Starbucks"}) }

  subject { service }

  it "searches google books and returns proper item" do
  	api_response = File.new "#{Rails.root}/spec/services/google_books_canned_response.json"
  	stub_request(:get, "https://www.googleapis.com/books/v1/volumes?country=&maxResults=1&q=Starbucks&startIndex=0").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => api_response, :headers => {})
    service_response = service.search
  	expect(service_response.title).to eq("Starbucks")
  	expect(service_response.isbn).to eq("9780313364587")
  end
end

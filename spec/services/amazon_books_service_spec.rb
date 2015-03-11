require 'rails_helper'

RSpec.describe AmazonBooksService do
  let(:service) { AmazonBooksService.new({isbns: ["9780313364587"]}) }

  subject { service }

  it "searches google books and returns proper item" do
  	api_response = File.new "#{Rails.root}/spec/services/amazon_books_canned_response.xml"
    #stub_request(:get, "http://webservices.amazon.com/onca/xml?AWSAccessKeyId=AKIAIWO3OEDYYTGZ5HOQ&AssociateTag=readinglist09-20&IdType=ISBN&ItemId=9780313364587&Operation=ItemLookup&ResponseGroup=ItemAttributes&SearchIndex=Books&Service=AWSECommerceService&Signature=am8BWpCI8de53jAYR2%2B6rGEr/UxwY/0fJz%2BDRVyNo%2Bc=&SignatureMethod=HmacSHA256&SignatureVersion=2&Timestamp=2015-03-08T01:16:12Z&Version=2011-08-01").
    #     with(:headers => {'Host'=>'webservices.amazon.com', 'User-Agent'=>'Jeff/1.2.0 (Language=Ruby; Simons-MacBook-Pro-2.local)'}).
    #     to_return(:status => 200, :body => "", :headers => {})
    #service_response = service.search
    #expect(service_response["ItemAttributes"]["ISBN"]).to_not be_nil
  end
end

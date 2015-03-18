# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  username               :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime
#  updated_at             :datetime
#  slug                   :string
#

require 'rails_helper'

RSpec.describe User, type: :model do
  
	let(:user) { build(:user) }
	subject { user }

	it { is_expected.to have_many(:lists) }
	it { is_expected.to have_many(:book_requests) }
	context "destroying a user" do
		it "destroys dependent records" do
			user.save
			book_request = create(:book_request, user: user)
			expect{user.destroy}.to change(BookRequest, :count).by(-1)
		end
	end

end

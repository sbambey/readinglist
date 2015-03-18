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

class ListItem < ActiveRecord::Base
	belongs_to :list

	validates_presence_of :title
end

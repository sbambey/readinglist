class AddPersonalNoteToListItems < ActiveRecord::Migration
  def change
    add_column :list_items, :personal_note, :text
  end
end

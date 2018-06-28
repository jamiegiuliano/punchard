class AddLinkIdToCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :link_id, :integer
  end
end

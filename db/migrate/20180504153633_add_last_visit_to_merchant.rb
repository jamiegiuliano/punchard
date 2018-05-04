class AddLastVisitToMerchant < ActiveRecord::Migration[5.2]
  def change
    add_column :merchants, :last_visit, :string
  end
end

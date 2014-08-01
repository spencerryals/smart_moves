class AddZiPtoUsers < ActiveRecord::Migration
  def change
  	add_column :users, :ZIP, :string
  end
end

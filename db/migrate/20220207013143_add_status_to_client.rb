class AddStatusToClient < ActiveRecord::Migration[7.0]
  def change
    add_column :clients, :status, :integer, default: 1
  end
end

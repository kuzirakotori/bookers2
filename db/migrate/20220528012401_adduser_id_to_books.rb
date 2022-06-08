class AdduserIdToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books,:user_id,:integer,foreign_key: { to_table: :users }
  end
end

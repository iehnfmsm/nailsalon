class CreatePrefers < ActiveRecord::Migration[6.0]
  def change
    create_table :prefers do |t|
      t.integer :prefer_time_id, null: false
      t.integer :prefer_wday_id, null: false
      t.timestamps
    end
  end
end

class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.references :user, null: false
      t.date       :date, null: false
      t.integer    :prefer_time_id, null: false
      t.string     :remark
      t.timestamps
    end
  end
end

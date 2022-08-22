class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.date       :date, null: false
      t.integer    :prefer_id, null: false
      t.string     :remark
      t.datetime   :start_time, null: false
      t.timestamps
    end
  end
end

class CreateUserPrefers < ActiveRecord::Migration[6.0]
  def change
    create_table :user_prefers do |t|
      t.references :user, null: false, foreign_key: true
      t.integer    :prefer_id, null: false
      t.timestamps
    end
  end
end

##UserモデルPreferモデルの後に作成しないとエラーが出る
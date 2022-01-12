class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :service, null: false, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end

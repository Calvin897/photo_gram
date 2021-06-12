class CreateNotices < ActiveRecord::Migration[6.1]
  def change
    create_table :notices do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :notified_by
      t.references :post, null: false, foreign_key: true
      t.integer :identifier
      t.string :notice_type
      t.boolean :read

      t.timestamps
    end
  end
end

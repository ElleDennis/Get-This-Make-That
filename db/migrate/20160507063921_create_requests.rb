class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :title
      t.text :content

      t.references :user

      t.timestamps
    end
  end
end

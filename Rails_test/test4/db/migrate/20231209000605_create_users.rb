class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :title
      t.text :text_content

      t.timestamps
    end
  end
end

class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :text_content
      t.string :sort_word

      t.timestamps
    end
  end
end

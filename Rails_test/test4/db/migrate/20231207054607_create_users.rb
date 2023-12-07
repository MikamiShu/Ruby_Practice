class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :seach_word
      t.string :text_content
      t.string :sort_word

      t.timestamps
    end
  end
end

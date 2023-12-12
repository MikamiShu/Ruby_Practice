class CreateScores < ActiveRecord::Migration[7.1]
  def change
    create_table :scores do |t|
      t.string :name
      t.string :composer
      t.string :arranger
      t.string :grade

      t.timestamps
    end
  end
end

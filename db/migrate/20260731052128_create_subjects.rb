class CreateSubjects < ActiveRecord::Migration[8.1]
  def change
    create_table :subjects do |t|
      t.string :name
      t.text :description
      t.integer :target_hours
      t.date :exam_date

      t.timestamps
    end
  end
end

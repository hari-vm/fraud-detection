class CreateClassifyData < ActiveRecord::Migration[8.0]
  def change
    create_table :classify_data do |t|
      t.string :data
      t.string :classification

      t.timestamps
    end
  end
end

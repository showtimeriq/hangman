class CreateWords < ActiveRecord::Migration[6.1]
  def change
    create_table :words do |t|
      t.text :name
      

      t.timestamps
    end
  end
end

class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :name
      t.integer :remaining_num_guesses 
      t.string :guessed_letters
      t.timestamps
    end
  end
end

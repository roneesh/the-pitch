class CreatePrompts < ActiveRecord::Migration
  def change
    create_table :prompts do |t|
      t.string :custom_question
      t.string :custom_answer
      t.integer :pitch_id

      t.timestamps
    end
  end
end

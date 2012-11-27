class CreatePrompts < ActiveRecord::Migration
  def change
    create_table :prompts do |t|
      t.integer :pitch_id
      t.string :custom_answer
      t.string :custom_question

      t.timestamps
    end
  end
end

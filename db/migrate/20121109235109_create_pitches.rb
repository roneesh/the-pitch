class CreatePitches < ActiveRecord::Migration
  def change
    create_table :pitches do |t|
      t.string :headline
      t.integer :user_id
      t.integer :job_id

      t.timestamps
    end
  end
end

class Prompt < ActiveRecord::Base
  attr_accessible :custom_answer, :custom_question, :pitch_id

  belongs_to :pitch

end

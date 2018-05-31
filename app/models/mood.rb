class Mood < ApplicationRecord
  belongs_to :project
  belongs_to :user

  TRANSITIONS = {
    'scenery' => 'lifestyle',
    'lifestyle' => 'party'
  }
end



class Note < ApplicationRecord
  belongs_to :user
  belongs_to :verse
end

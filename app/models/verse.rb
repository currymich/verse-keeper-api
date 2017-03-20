class Verse < ApplicationRecord
  has_one :note, dependent: :destroy
  belongs_to :user
end

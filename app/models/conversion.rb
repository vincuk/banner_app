class Conversion < ActiveRecord::Base
  belongs_to :click
  
  validates :conversion_id, presence: true, uniqueness: true, numericality: { only_integer: true }
  validates :click_id, presence: true, uniqueness: true, numericality: { only_integer: true }
  validates :revenue, presence: true, numericality: true
end

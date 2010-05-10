class Reservation < ActiveRecord::Base
  belongs_to :showing
  validates_presence_of :chairs


end

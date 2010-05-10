class Film < ActiveRecord::Base
  has_many :showings
  validates_presence_of :title, :director, :cast, :plot, :genre, :run_time
  
  def title_with_initial
    "#{title} - #{director}"
  end
end

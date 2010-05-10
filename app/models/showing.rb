class Showing < ActiveRecord::Base
  scope :today, where("date = ?", Date.today)
  scope :active, where("date >= ?", Date.today)
  
  belongs_to :film
  belongs_to :room
  validates_presence_of :film_id, :room_id, :date, :time
  def self.group_by_films
    grouped = Showing.active.group_by{|i| i.film_id}
  end

  def self.week
    Showing.where("date >= ? and date <= ?", Date.today,  Date.today + 7.days)
  end

end

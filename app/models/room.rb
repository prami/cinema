class Room < ActiveRecord::Base
  attr_accessor :rows_no, :chair_no
  has_many :showings
  before_create :add_chair
  validates_presence_of :name
  validates_presence_of :rows_no, :chair_no, :on => :create
  validates_numericality_of :rows_no, :chair_no, :on => :create

  def add_chair
    rows = Array.new(rows_no.to_i)
    rows.map!{Array.new(chair_no.to_i, 1)}
    self.chairs = rows.to_json
  end

  def name_with_initial
    name.to_s
  end
end

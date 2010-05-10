require 'spec_helper'
require 'json'
describe Room do
  before(:each) do
    @valid_attrs={
      :chair_no => 11,
      :rows_no => 11,
      :name=>"Sala 11",
      :description=>"Sala 3d w remoncie",
      :chairs => "[[1,1,1,1,1,1,1,1,1,1,1],[1,1,1,1,1,1,1,1,1,1,1],[1,1,1,1,1,1,1,1,1,1,1],[1,1,1,1,1,1,1,1,1,1,1],[1,1,1,1,1,1,1,1,1,1,1],[1,1,1,1,1,1,1,1,1,1,1],[1,1,1,1,1,1,1,1,1,1,1],[1,1,1,1,1,1,1,1,1,1,1],[1,1,1,1,1,1,1,1,1,1,1],[1,1,1,1,1,1,1,1,1,1,1],[1,1,1,1,1,1,1,1,1,1,1]]"
    }
    @room = Room.new(@valid_attrs)
  end

  it "Powinien być poprawny z podanymi atrybutami" do
    @room.should be_valid
  end

  it "Powinna posiadać nazwę" do
    @room.name = nil
    @room.should be_invalid
    @room.save.should be_false
    @room.name = "sala 2"
    @room.should be_valid
  end

  it "" do
    rows = Array.new(@room.rows_no.to_i)
    rows.map!{Array.new(@room.chair_no.to_i, 1)}
    rows.to_json.should be_eql @room.chairs
  end
end

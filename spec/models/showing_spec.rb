require 'spec_helper'

describe Showing do
  before(:each) do
    @valid_attrs={
      :film_id => 3,
      :room_id => 11,
      :date=>Date.today,
      :time=>'11:03',
      :description=>"Sala 3d w remoncie",
    }
    @showing = Showing.new(@valid_attrs)
  end

  it "Powinien być poprawny z podanymi atrybutami" do
    @showing.should be_valid
  end
end

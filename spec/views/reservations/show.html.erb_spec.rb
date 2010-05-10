require 'spec_helper'

describe "reservations/show.html.erb" do
  before(:each) do
    assign(:reservation, @reservation = stub_model(Reservation,
      :showing_id => 1,
      :row => 1,
      :chair => 1,
      :name => "MyString",
      :surname => "MyString",
      :phone => "MyString",
      :ticket => "MyString"
    ))
  end

  it "renders attributes in <p>" do
    render
    response.should contain(1)
    response.should contain(1)
    response.should contain(1)
    response.should contain("MyString")
    response.should contain("MyString")
    response.should contain("MyString")
    response.should contain("MyString")
  end
end

require 'spec_helper'

describe "reservations/index.html.erb" do
  before(:each) do
    assign(:reservations, [
      stub_model(Reservation,
        :showing_id => 1,
        :row => 1,
        :chair => 1,
        :name => "MyString",
        :surname => "MyString",
        :phone => "MyString",
        :ticket => "MyString"
      ),
      stub_model(Reservation,
        :showing_id => 1,
        :row => 1,
        :chair => 1,
        :name => "MyString",
        :surname => "MyString",
        :phone => "MyString",
        :ticket => "MyString"
      )
    ])
  end

  it "renders a list of reservations" do
    render
    response.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    response.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    response.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    response.should have_selector("tr>td", :content => "MyString".to_s, :count => 2)
    response.should have_selector("tr>td", :content => "MyString".to_s, :count => 2)
    response.should have_selector("tr>td", :content => "MyString".to_s, :count => 2)
    response.should have_selector("tr>td", :content => "MyString".to_s, :count => 2)
  end
end

require 'spec_helper'

describe "reservations/new.html.erb" do
  before(:each) do
    assign(:reservation, stub_model(Reservation,
      :new_record? => true,
      :showing_id => 1,
      :row => 1,
      :chair => 1,
      :name => "MyString",
      :surname => "MyString",
      :phone => "MyString",
      :ticket => "MyString"
    ))
  end

  it "renders new reservation form" do
    render

    response.should have_selector("form", :action => reservations_path, :method => "post") do |form|
      form.should have_selector("input#reservation_showing_id", :name => "reservation[showing_id]")
      form.should have_selector("input#reservation_row", :name => "reservation[row]")
      form.should have_selector("input#reservation_chair", :name => "reservation[chair]")
      form.should have_selector("input#reservation_name", :name => "reservation[name]")
      form.should have_selector("input#reservation_surname", :name => "reservation[surname]")
      form.should have_selector("input#reservation_phone", :name => "reservation[phone]")
      form.should have_selector("input#reservation_ticket", :name => "reservation[ticket]")
    end
  end
end

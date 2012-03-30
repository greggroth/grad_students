require 'spec_helper'

describe "professors/new" do
  before(:each) do
    assign(:professor, stub_model(Professor,
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString"
    ).as_new_record)
  end

  it "renders new professor form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => professors_path, :method => "post" do
      assert_select "input#professor_first_name", :name => "professor[first_name]"
      assert_select "input#professor_last_name", :name => "professor[last_name]"
      assert_select "input#professor_email", :name => "professor[email]"
    end
  end
end

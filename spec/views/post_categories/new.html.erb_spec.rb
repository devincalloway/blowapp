require 'spec_helper'

describe "post_categories/new" do
  before(:each) do
    assign(:post_category, stub_model(PostCategory,
      :name => "MyString",
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new post_category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => post_categories_path, :method => "post" do
      assert_select "input#post_category_name", :name => "post_category[name]"
      assert_select "input#post_category_description", :name => "post_category[description]"
    end
  end
end

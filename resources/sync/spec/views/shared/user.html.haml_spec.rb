require 'spec_helper'

describe "/shared/user" do
  before(:each) do
    assign(:user, stub_model(User,
      email: "value for email",
      name: "value for name",
      country: stub_model(Country, name: "state of mind")
    ){|u| u.stub(roles: []) })
  end

  it "renders attributes in <p>" do
    render
    rendered.should have_content("value for email")
    rendered.should have_content("value for name")
  end
end

require 'spec_helper'

describe "/admin/users/index" do
  include Admin::UsersHelper

  before(:each) do
    assign(:users, [
      stub_model(User,
        email: "value for email",
        name: "value for name"
      ){|u| u.stub(roles: []) },
      stub_model(User,
        email: "value for email",
        name: "value for name"
      ){|u| u.stub(roles: []) }
    ])
  end

  it "renders a list of users" do
    render
    rendered.should have_selector "tr>td", text: "value for name", count: 2
    rendered.should have_selector "tr>td", text: "value for email", count: 2
  end
end

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/leads/new.html.erb" do
  include LeadsHelper
  
  before(:each) do
    assigns[:current_user] = stub_model(User)
    assigns[:lead] = stub_model(Lead, :new_record? => true)
    assigns[:users] = [ stub_model(User) ]
    assigns[:campaigns] = [ stub_model(Campaign) ]
    Setting.stub!(:lead_status).and_return({ :key => "value" })
    Setting.stub!(:lead_source).and_return({ :key => "value" })
  end

  it "should render new form" do
    render "/leads/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", leads_path) do
    end
  end
end


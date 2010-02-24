require File.dirname(__FILE__) + '/spec_helper'

describe "Glog" do
  include Rack::Test::Methods

  def app
    @app ||= Sinatra::Application
  end

  context "viewing the home page" do
    before(:each) do
      get '/'
    end
    it "renders" do
      last_response.should be_ok
    end
    it "displays a link to the repo" do
      last_response.body.should match(%Q{href="/glog/commits"})
    end
  end

end

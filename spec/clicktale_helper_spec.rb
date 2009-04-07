require File.dirname(__FILE__) + "/lib/attribute_accessors"
require File.dirname(__FILE__) + '/../lib/clicktale'
require File.dirname(__FILE__) + '/../lib/clicktale_helper'

context "ClicktaleHelper instance" do  
  include ClicktaleHelper
  
  before(:each) do
    Clicktale.project_id  = '8001'
    Clicktale.ratio       = '0.25'
  end
  
  it "should build fetch url" do
    lambda {
      result = clicktale_fetch_from
      result.should match(/param1=value1/)
      result.should match(/param2=value2/)
      result.should match(/_session=1234567890/)
    }.should_not raise_error
  end
  
  it "should build tracker code" do
    lambda {
      result = clicktale_tracker
      result.should match(/ClickTaleFetchFrom = 'http:\/\/test.uri\/some_controller\/some_action\?param1=value1&param2=value2&_session=1234567890/)
      result.should match(/ClickTale\(8001, 0\.25\)/)
    }.should_not raise_error
  end
  
  protected
    def request
      methods = {
        :request_uri => "/some_controller/some_action?param1=value1&param2=value2&_session=111000111",
        :protocol => "http://",
        :host => "test.uri",
        :session_options => { :session_key => '_session' }
      }
      mock('Request', methods)
    end
  
    def session
      mock('Session', { :session_id => '1234567890' })      
    end
    
    def controller
      mock('Controller', { :request => request })
    end
end
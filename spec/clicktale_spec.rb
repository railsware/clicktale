require File.dirname(__FILE__) + "/lib/attribute_accessors"
require File.dirname(__FILE__) + '/../lib/clicktale'

context "Clicktale class" do
  ["project_id", "ratio"].each do |attr|
    it "should have #{attr} class attribute" do
      Clicktale.singleton_methods.should include("#{attr}=")
      Clicktale.singleton_methods.should include(attr)
    end
  end
end
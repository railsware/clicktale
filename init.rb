require 'clicktale'
require 'clicktale_helper'

ActionController::Base.session_options[:expire_after] = 1.year
ActionView::Base.send(:include, ClicktaleHelper)
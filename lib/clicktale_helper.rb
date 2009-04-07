module ClicktaleHelper
  def clicktale_tracker
    <<-EOS
      <!-- ClickTale Bottom part -->
      <div id="ClickTaleDiv" style="display: none;"></div>
      <script src="http://s.clicktale.net/WRb.js" type="text/javascript"></script>
      <script type="text/javascript">
      if(typeof ClickTale=='function'){
      	#{clicktale_fetch_from}
      	ClickTale(#{Clicktale.project_id}, #{Clicktale.ratio});
      }
      </script>
      <!-- ClickTale end of Bottom part -->
    EOS
  end
  
  def clicktale_fetch_from
  	url = if request.request_uri.index Regexp.new("^(.*)(\\?|\\&)#{controller.request.session_options[:session_key]}=(.*)(\\&|\\z)")
      "#{request.protocol}#{request.host}#{request.request_uri}".
        gsub(Regexp.new("#{controller.request.session_options[:session_key]}=(.*)(\\&|\\z)"), "#{controller.request.session_options[:session_key]}=#{session.session_id}")
  	else
  	  "#{request.protocol}#{request.host}#{request.request_uri}#{request.request_uri.index(/\?/) ? '&' : '?'}#{controller.request.session_options[:session_key]}=#{session.session_id}"
  	end
  	"ClickTaleFetchFrom = '#{url}'"
  end
end
require File.expand_path(File.dirname(__FILE__) + '/lib/google_analytics')
Dir['./lib/**/*.rb'].each { |f| require f }

class GoogleAnalyticsEndpoint < EndpointBase

  set :logging, true

  post '/track_order' do
    google_analytics = GoogleAnalytics.new(@message[:payload], @message[:message_id], @config)
    process_result *google_analytics.track_order
  end

end

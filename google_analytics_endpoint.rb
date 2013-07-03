require File.expand_path(File.dirname(__FILE__) + '/lib/google_analytics')
Dir['./lib/**/*.rb'].each { |f| require f }

class GoogleAnalyticsEndpoint < EndpointBase

  set :logging, true

  # post '/order_confirmation' do
  #   order = OrderConfirmation.new(@message[:payload], @message[:message_id], @config)
  #   process_result *order.consume
  # end

end

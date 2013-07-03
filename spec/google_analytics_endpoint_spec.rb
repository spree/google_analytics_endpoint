require 'spec_helper'

describe GoogleAnalyticsEndpoint do
  let(:config) { [{ 'name' => 'google.tracking_id', 'value' => 'UA-XXXX-Y' }] }

  let(:message) {{ 'store_id' => '123229227575e4645c000001',
                   'message_id' => 'abc',
                   'payload' => { 'order' => { 'actual' => Factories.order },
                                  'parameters' => config } }}

  def auth
    {'HTTP_X_AUGURY_TOKEN' => 'x123', "CONTENT_TYPE" => "application/json"}
  end

  def app
    GoogleAnalyticsEndpoint
  end


end

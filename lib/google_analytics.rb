
# POST /collect HTTP/1.1
# Host: www.google-analytics.com

# payload_data

## Required params:

# v=1             // Version.
# &tid=UA-XXXX-Y  // Tracking ID / Web property / Property ID.
# &cid=555        // Anonymous Client ID.
# &t=             // Hit Type.


class GoogleAnalytics
  include HTTParty
  base_uri 'http://www.google-analytics.com'

  attr_accessor :order, :tracking_id, :config, :message_id

  def initialize(payload, message_id, config={})
    @order = payload['order']['actual']
    @config = config
    @tracking_id = config['google.tracking_id']
    @message_id = message_id
  end

  def track_order
    send_transaction_hit(transaction_hash_from_order)
    items_hash_from_order.each do |item_hash|
      send_item_hit(item_hash)
    end
  end

  def send_transaction_hit(transaction)
    class.self.post('collect', body: transaction)
  end

  def send_item_hit(item)
    class.self.post('collect', body: item)
  end

  def transaction_hash_from_order
    {}
  end

  def items_hash_from_order
    [{}]
  end

end
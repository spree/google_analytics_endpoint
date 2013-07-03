# Measurement Protocol.

https://developers.google.com/analytics/devguides/collection/protocol/v1/devguide#ecom

To send user interaction data, make an HTTP POST request to this endpoint.
```
POST /collect HTTP/1.1
Host: www.google-analytics.com

payload_data
```

The following parameters are required for each payload:
```
v=1             // Version.
&tid=UA-XXXX-Y  // Tracking ID / Web property / Property ID.
&cid=555        // Anonymous Client ID.
&t=             // Hit Type.
```

## Ecommerce Tracking

To send ecommerce data, send one transaction hit to represent an entire transaction, then send an item hit for each item in the transaction. The transaction ID ```ti``` links all the hits together to represent the entire purchase.

### Transaction hit
```
v=1              // Version.
&tid=UA-XXXX-Y   // Tracking ID / Web property / Property ID.
&cid=555         // Anonymous Client ID.

&t=transaction   // Transaction hit type.
&ti=12345        // transaction ID. Required.
&ta=westernWear  // Transaction affiliation.
&tr=50.00        // Transaction revenue.
&ts=32.00        // Transaction shipping.
&tt=12.00        // Transaction tax.
&cu=EUR          // Currency code.
```

### Item hit

```
v=1              // Version.
&tid=UA-XXXX-Y   // Tracking ID / Web property / Property ID.
&cid=555         // Anonymous Client ID.

&t=item          // Item hit type.
&ti=12345        // Transaction ID. Required.
&in=sofa         // Item name. Required.
&ip=300          // Item price.
&iq=2            // Item quantity.
&ic=u3eqds43     // Item code / SKU.
&iv=furniture    // Item variation / category.
&cu=EUR          // Currency code.
```
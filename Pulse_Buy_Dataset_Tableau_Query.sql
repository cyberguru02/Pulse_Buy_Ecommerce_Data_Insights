SELECT 
    orders.id AS order_id,
orders.customer_id,
  orders.transaction_id,
  orders.product_id,
  orders.product_name,
  orders.currency_code,
  orders.price_local,
  orders.price_usd,
  orders.purchase_platform,
  customers.marketing_channel,
  customers.account_creation_method,
  customers.country_code,
  customers.loyalty_program,
  customers.account_creation_date,
  geo_lookup.region,
  order_status.shipment_date,
  order_status.delivery_date,
  order_status.return_date,
  date_diff(order_status.shipment_date, orders.purchase_date, day) as purchase_to_ship_days,
  date_diff(order_status.purchase_date, customers.account_creation_date, day) as ship_to_delivery_days
from pulse-415501.pulsebuy.orders as orders
LEFT JOIN 
    pulse-415501.pulsebuy.customers as customers 
ON
    orders.customer_id = customers.id
LEFT JOIN 
    pulse-415501.pulsebuy.geo_lookup geo_lookup 
ON
    customers.country_code = geo_lookup.country
LEFT JOIN 
    pulse-415501.pulsebuy.order_status as order_status 
ON
    orders.id = order_status.transaction_id;

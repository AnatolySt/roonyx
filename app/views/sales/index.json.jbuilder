json.from @start_date
json.to @end_date

json.goods @goods do |good|
  json.name good.title
  json.revenue good.revenue(@start_date, @end_date)
end

json.total_revenue Sale.total_revenue(@start_date, @end_date)
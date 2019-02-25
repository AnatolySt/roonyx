data = Roo::Excelx.new('./db/seeds.xlsx')
headers = {}
data.row(1).each_with_index { |header, index| headers[header] = index }
headers.delete('Good')

((data.first_row + 1)..data.last_row).each do |row|
  title = data.row(row)[0]
  good = Good.create(title: title)

  headers.each do |header, index|
    good.sales.create(date: header, revenue: data.row(row)[index])
  end
end
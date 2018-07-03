class Order
  attr_reader :email, :total, :state, :status

  @@customer_count = 0

  Tax_Table = {"CO" => 0.02, "MI" => 0.00, "AZ" => 0.04}
  @@TotalOrders = {}


  def initialize(email, state, total, status=:pending)
    @email = email
    @state = state
    @total = total
    @status = status

    @@customer_count += 1
    @@TotalOrders[@email] = @total

  end

  def tax
    total * Tax_Table[state]
  end

  def to_info
    "#{email} #{state} : $#{total} #{status}"
  end

  def customer_info
    "Email: #{email} State: #{state} Total: $#{total} Status: #{status}"
  end

  def self.customercount
    "You have #{@@customer_count} account(s) in the system."
  end

  def self.totals
    @@TotalOrders
  end

end

Riley = Order.new("info@riley.com", "CO", 476)
Howard = Order.new("info@howard.com", "MI", 1003)
Smith = Order.new("info@smith.com", "NY", 355)





puts Riley.email
puts Riley.customer_info
puts Riley.to_info
puts Order.customercount

puts "Newsletter Emails:"

puts Riley.total + Howard.total
puts Order.totals

all_values = []
Order.totals.each do | key, value |
  all_values.push(value)
end
puts all_values
puts total_orders = all_values.reduce(:+)
puts small_orders = all_values.select {|x| x < 500 }
puts "***********"
Order.totals.each do |key, value|
  if key === "info@riley.com" then puts key else puts "no" end

end
#one line conditional
Order.totals.each do |key, value|
  puts "#{key}: #{value}" if key === "info@riley.com"

end

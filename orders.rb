class Order
  attr_reader :email, :total, :state, :status

  @@customer_count = 0

  Tax_Table = {"CO" => 0.02, "MI" => 0.00, "AZ" => 0.04}

  def initialize(email, state, total, status=:pending)
    @email = email
    @state = state
    @total = total
    @status = status

    @@customer_count += 1
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

end

Riley = Order.new("info@riley.com", "CO", 476)

puts Riley.email
puts Riley.customer_info
puts Riley.to_info
puts Order.customercount

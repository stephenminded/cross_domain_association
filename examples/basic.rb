o = Order.new
puts o.inspect

o.class.include(CrossDomainDecorator)
puts o.class.ancestors

puts o.name.inspect

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "basic operation" do
    o = Order.new
    o.class.include(CrossDomainDecorator)

    puts "\n\nInstance method:"
    o.name

    puts "\n\nClass method:"
    Order.where(name: "Foo")
  end

end

class Order < ApplicationRecord
  belongs_to :customer

  def customer
    super.tap do |obj|
      obj.class.include(CrossDomainDecorator)
    end
  end
end

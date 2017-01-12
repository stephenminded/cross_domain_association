module DecorateAssociations
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def cross_domain_belongs_to

    end
  end
end

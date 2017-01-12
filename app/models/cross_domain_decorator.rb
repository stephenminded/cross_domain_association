module CrossDomainDecorator
  def self.included(base)
    decorator_name = "#{base}CrossDomainDecorator"
    decorator = begin
      const_get(decorator_name)
    rescue NameError
      const_set(decorator_name, Module.new)
    end
    return if base.ancestors.include?(decorator)

    ignore_methods = [Kernel, BasicObject, Object].flat_map(&:instance_methods)
    methods = (base.instance_methods - ignore_methods)
    methods.each do |imethod|
      decorator.class_eval do
        define_method(imethod) do |*args, &block|
          call_path = caller.first
          if call_path.include(Rails.root.to_s)
            puts "called `#{imethod}` from #{caller(1).first}"
          end
          super(*args, &block)
        end
      end
    end
    base.prepend(decorator)
  end
end

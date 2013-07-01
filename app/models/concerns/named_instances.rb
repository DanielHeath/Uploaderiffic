
module NamedInstances
  extend ActiveSupport::Concern

  module ClassMethods
    def [](key)
      instances[key]
    end

    def new(*args)
      super.tap do |instance|
        instances[instance.name] = instance
      end
    end

    private
    def instances
      @instances ||= {}
    end
  end
end

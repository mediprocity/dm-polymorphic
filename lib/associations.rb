module DataMapper
  module Associations
  
    alias_method :has_without_polymorphism, :has
    
    def has(cardinality, name, opts = {})
      if interface = opts.delete(:via)
        
        # get the child model
        child_model_name =  opts.fetch(:class_name, Extlib::Inflection.classify(name))
        child_klass =       Extlib::Inflection.constantize(child_model_name)
        belongs_to_name =   Extlib::Inflection.underscore(Extlib::Inflection.demodulize(self.name))
      
        # Setup the has with the right stuff
        has_without_polymorphism cardinality, name,   :child_key => [:"#{interface}_id"], child_klass.send(:"#{interface}_class") => self
        child_klass.belongs_to :"#{belongs_to_name}", :child_key => [:"#{interface}_id"], self.send(:"#{name}").send(:"#{interface}_class") => self
      else
        has_without_polymorphism(cardinality, name, opts)
      end
    end
  end
end
    
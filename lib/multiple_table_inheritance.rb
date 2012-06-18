module MultipleTableInheritance
  def acts_as inherited_class_name
    belongs_to inherited_class_name

    @@inherited_class_name = inherited_class_name
    self.primary_key ||=  inherited_class_name + "_id"

    define_method :inherited_association do
      ( send @@inherited_class_name ) || ( send :build_ + @@inherited_class_name )
    end

    alias_method :old_save, :save
    alias_method :old_initialize, :initialize
    #alias_method :old_create, :create

    define_method :save do
      inherited_association.save
      old_save
    end

    define_method :initialize do |*args|
      begin
        old_initialize *args
      rescue ActiveModel::MassAssignmentSecurity::Error => e
        hash_param = args.first
        #TODO improve the way to retrieve attr_accessible from exception
        pp hash_param
        e.message.split( ":" ).last.split(",").map(&:squish).map(&:to_sym).each do |parent_var|
          send parent_var + "=", hash_param[parent_var]
        end
      end
    end

    define_method :method_missing do |method, *args|
      return inherited_association.send method, *args  unless args.empty?
      inherited_association.send method
    end

    klass_for_association = class_name.underscore.to_sym
    @@inherited_class_name.to_s.classify.constantize.class_exec do
      has_one klass_for_association

      @@inherit_to ||=[]
      @@inherit_to << klass_for_association
      pp @@inherit_to

      def class_name_to_association klass
        ( send :klass ) || ( send :build_ + klass )
      end

      def method_missing method, *args
        @@inherit_to.each do |klass|
          if klass.to_s.classify.constantize.method_defined? method
            return class_name_to_association(klass).send method, *args
          end
        end
        return nil
      end
    end
  end
end

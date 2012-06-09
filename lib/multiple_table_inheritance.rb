module MultipleTableInheritance
  def acts_as class_name
    belongs_to class_name

    @@inherited_class_name = class_name
    self.primary_key = ( class_name.to_s.underscore + "_id" ).to_sym

    define_method :inherited_association do
      send @@inherited_class_name
    end

    alias_method :old_save, :save

    define_method :save do
      inherited_association.save!
      old_save
    end

    define_method :method_missing do |method, *args|
      unless inherited_association.nil?
        return inherited_association.send method, args  unless args.empty?
        inherited_association.send method
      end
    end
  end
end

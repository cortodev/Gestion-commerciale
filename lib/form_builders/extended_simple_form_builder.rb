class ExtendedSimpleFormBuilder < SimpleForm::FormBuilder
  TO_TEST = %w( inclusion numericality )

  delegate :content_tag, :tag, to: :@template

  def input(attribute_name, options = {}, &block)
    @validators = object.class.validators_on attribute_name
    options.merge! range
    options.merge! html_options
    super(attribute_name, options, &block)
  end

  private

  TO_TEST.each do |validation_type|
    define_method validation_type do
      @validators.select { |v| v.kind_of? "ActiveModel::Validations::#{validation_type.classify}Validator".constantize }.first
    end
  end

  def range
    include_values = inclusion.options[:in] unless inclusion.nil? or not inclusion.options.key? :in
    return { collection: include_values, as: :radio_buttons } unless include_values.nil?
    {}
  end

  #TODO
  def html_options
    { input_html: min }
  end

  def min
    greater_than = numericality.options.keys.select { |k| k =~ /greater_than/ }.first unless  numericality.nil?
    return { min: numericality.options[greater_than] } unless greater_than.nil?
    {}
  end
end

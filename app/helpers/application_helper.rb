module ApplicationHelper
  def extended_simple_form_for(object, *args, &block)
    options = args.extract_options!
    simple_form_for(object, *(args << options.merge(builder: ExtendedSimpleFormBuilder)), &block)
  end
end

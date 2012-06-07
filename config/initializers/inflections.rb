# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format
# (all these examples are active by default):
 ActiveSupport::Inflector.inflections do |inflect|
  inflect.irregular 'adresse', 'adresses'
  inflect.irregular 'adress', 'adress'
  inflect.plural /^(.*)al$/i, '\1aux'
  inflect.singular 'commerciaux', 'commercial'
  inflect.irregular 'naval', 'navals'
  inflect.irregular 'narval', 'narvals'
  inflect.irregular 'banal', 'banals'
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
 end
#
# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections do |inflect|
#   inflect.acronym 'RESTful'
# end

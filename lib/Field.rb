# The Field class is a container for the field name and a list
# of attributes associated with this field.
#
class Field
  attr_reader :name

  def initialize(name)
    @name = name
    @attributes = {}
  end

  def add_attr(name, value)
    @attributes[name] = value
  end

  def attr_count
    @attributes.length
  end

  def attr_value(name)
    @attributes[name]
  end
end

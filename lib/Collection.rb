# The Collectio class stores a collection name and all fields
# associated with that collection.
#
class Collection
  attr_reader :name

  def initialize(name)
    @name = name
    @fields = {}
  end

  def add_field(field)
    @fields[field.name] = field
  end

  def field_count
    @fields.length
  end

end

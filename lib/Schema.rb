# The Schema class acts as an API to accept, process and query the
# database schema.
#
class Schema
  DATABASE_KEYWORD = 'database'
  COLLECTIONS_KEYWORD = 'collections'

  def initialize
    @schema = {}
  end

  def set(schema)
    @schema = schema
  end

  def database
    @schema[DATABASE_KEYWORD]
  end

  def collections
    @schema[COLLECTIONS_KEYWORD].keys
  end

  def get_fields(collection)
    @schema[COLLECTIONS_KEYWORD][collection].keys
  end
end

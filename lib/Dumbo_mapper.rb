module DumboMapper
  # DumboMapper in the top level class exposed to users.
  #
  class DumboMapper
    DATABASE_KW = 'database'

    def initialize(obj, mongo_client, parser, collection_name)
      @obj = obj
      @mongo_client = mongo_client
      @schema = parser.schema

      db_name = @schema['DATABASE_KW']
      db = @mongo_client[db_name]
      @collection = db[collection_name]
    end

    def save!(opts={})
      fields = opts[:fields]
      field_groups = opts[:field_groups]

      rec = {"field1" => "val1", "field2" => "val2"}
      @collection.insert(rec)
    end

    def load(key)
    end
  end
end

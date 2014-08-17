# THe Parser class converts a YAML representation of a schema into
# a Schma class object.
#
class Parser
  DATABASE_KEYWORD = 'database'
  COLLECTIONS_KEYWORD = 'collections'
  REQUIRED_ELEMENTS = [DATABASE_KEYWORD, COLLECTIONS_KEYWORD]

  attr_reader :schema

  def initialize(yaml_file)
    @yaml = Psych.load_file(yaml_file)
    @schema = schema_valid? ? build_schema : nil
  end

  private
  def schema_valid?
    check_top_level_elements
    check_for_at_least_one_collection
    check_all_collections_valid
    true
  end

  def check_top_level_elements
    REQUIRED_ELEMENTS.each do |elem|
      unless @yaml.key?(elem)
        raise "YAML did not contain element #{elem}"
      end
    end
  end

  def check_for_at_least_one_collection
    if collections_element_is_valid_type? ||
       collections_element_is_empty?
       (@yaml[COLLECTIONS_KEYWORD].length == 0)
      raise "YAML does not contain at least one collection element"
    end
  end

  def collections_element_is_valid_type?
    @yaml[COLLECTIONS_KEYWORD].class != Hash
  end

  def collections_element_is_empty?
   @yaml[COLLECTIONS_KEYWORD].length == 0
  end

  def check_all_collections_valid
   invalid = false
   @yaml[COLLECTIONS_KEYWORD].each do |coll_name, coll_hash|
     invalid ||= collection_invalid?(coll_hash)
   end
   raise "Collection is not valid - must have fields" if invalid
  end

  def collection_invalid?(coll)
    (coll.class != Hash) || (coll.length == 0)
  end

  def build_schema
    schema = {}
    schema[DATABASE_KEYWORD] = @yaml[DATABASE_KEYWORD]
    schema[COLLECTIONS_KEYWORD] = {}

    @yaml[COLLECTIONS_KEYWORD].each do |coll_name, coll_body|
      fields = process_fields(coll_body)
      schema[COLLECTIONS_KEYWORD][coll_name] = fields
    end

    schema
  end

  def process_fields(coll_body)
    fields = {}
    coll_body.each do |field, attr|
      fields[field] = create_field_attr_hash(attr)
    end

    fields
  end

  def create_field_attr_hash(attr)
    field_hash = {}
    index = 0
    attr.split(' ').each do |token|
      if (index == 0) && !token.match(/^:/)
        field_hash['type'] = token
      else
        key = token.sub(/^:/, '')
        field_hash[key] = true
      end
      index += 1
    end

    field_hash
  end
end

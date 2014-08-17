require_relative 'spec_helper'

describe Schema do
  let(:valid_schema) do
    {
      'database' => 'db_name',
      'collections' => {
        'coll_1' => {
          'field_1' => {
            'type' => 'string',
            'key' => true
          },
          'field_2' => {
            'type' => 'integer'
          }
        },
        'coll_2' => {
          'field_3' => {
            'type' => 'date',
            'key' => true
          },
          'field_4' => {
            'type' => 'list'
          }
        },
      }
    }
  end

  before(:each) do
    @schema = Schema.new
    @schema.set(valid_schema)
  end

  it "should accept a valid schema and find db name" do
    expect(@schema.database).to eq('db_name')
  end

  it "can retrieve a list of collections" do
    expect(@schema.collections).to eq(['coll_1', 'coll_2'])
  end

  it "can retrieve a list of field names for a collection" do
    fields = @schema.get_fields('coll_1')
    expect(fields).to eq(['field_1', 'field_2'])
  end

  it "can retrive a list of attributes for a single field" do
    pending
    expect(1).to eq(2)
  end
end

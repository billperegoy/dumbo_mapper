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

  it "should accept a valid schema and find db name" do
    schema = Schema.new
    schema.set(valid_schema)
    expect(schema.database).to eq('db_name_fail')
  end
end

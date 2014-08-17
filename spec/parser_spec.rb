require_relative 'spec_helper'

describe Parser do
  let(:valid_yaml) { 'spec/input_files/valid_schema.yml' }
  let(:missing_db_yaml) { 'spec/input_files/missing_database_schema.yml' }
  let(:missing_coll_yaml) { 'spec/input_files/missing_collections_schema.yml' }
  let(:empty_coll_yaml) { 'spec/input_files/empty_collections_schema.yml' }
  let(:no_fields_yaml) { 'spec/input_files/no_fields_schema.yml' }

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
        }
      }
    }
  end

  it "can read a YAML file into default structures" do
    expect { Parser.new(valid_yaml) }.to_not raise_error
  end

  it "raises exception if YAML doesn't contain a database field" do
    expect { Parser.new(missing_db_yaml) }.to raise_error
  end

  it "raises exception if YAML doesn't contain a collections field" do
    expect { Parser.new(missing_coll_yaml) }.to raise_error
  end

  it "raises exception if YAML doesn't contain at least one collection" do
    expect { Parser.new(empty_coll_yaml) }.to raise_error
  end

  it "raises exception if YAML collection contains no fields" do
    expect { Parser.new(no_fields_yaml) }.to raise_error
  end

  it "can read a YAML file and build a proper Schema object" do
    parser =  Parser.new(valid_yaml)
    expect(parser.schema).to eq(valid_schema)
  end
end

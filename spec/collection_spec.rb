require_relative 'spec_helper'

describe Collection do
  it "can be initailized with a name" do
    collection = Collection.new("coll_1")
    expect(collection.name).to eq("coll_1")
  end

  it "can accept new fields" do
    collection = Collection.new("coll_1")

    field_1 = Field.new('field_1')
    collection.add_field(field_1)

    field_2 = Field.new('field_2')
    collection.add_field(field_2)

    expect(collection.field_count).to eq(2)
  end

end

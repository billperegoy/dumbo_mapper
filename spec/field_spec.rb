require_relative 'spec_helper'

describe Field do
  it "can create a field" do
    field = Field.new('field_name')
    expect(field.name).to eq('field_name')
    expect(field.attr_count).to eq(0)
  end

  it "can accept attributes" do
    field = Field.new('field_name')
    field.add_attr('type', 'date')
    field.add_attr('key', true)
    expect(field.attr_count).to eq(2)
  end

  it "can lookup a particular attribute name" do
    field = Field.new('field_name')
    field.add_attr('type', 'date')
    field.add_attr('key', true)

    attr_value = field.attr_value('type')
    expect(attr_value).to eq('date')
  end
end

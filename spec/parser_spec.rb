require_relative 'spec_helper'

describe Parser do
  let(:valid_yaml) { 'spec/input_files/valid_schema.yml' }

  it "can read a YAML file into default structures" do
    parser = Parser.new(valid_yaml)
    expect(parser.valid?).to eq(true)
  end

  it "can read a YAML file and build a proper Schema object" do
    pending
    expect(1).to eq(2)
  end
end

# THe Parser class converts a YAML representation of a schema into
# a Schma class object.
#
class Parser
  def initialize(yaml_file)
    yaml = Psych.load_file(yaml_file)
  end

  def valid?
    true
  end
end

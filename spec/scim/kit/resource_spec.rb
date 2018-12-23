RSpec.describe Scim::Kit::Resource do
  subject { described_class.new(location: location) }
  let(:location) { FFaker::Internet.uri('https') }

  before do
    subject.id = "Group"
    subject.description = "Group"
    subject.endpoint = "https://www.example.org/scim/v2/groups"
    subject.name = "Group"
    subject.schema = Scim::Kit::Schema::GROUP
  end

  let(:hash) { JSON.parse(subject.to_json, symbolize_names: true) }

  specify { expect(hash[:meta][:location]).to eql(location) }
  specify { expect(hash[:meta][:resourceType]).to eql('ResourceType') }
  specify { expect(hash[:schemas]).to match_array([Scim::Kit::Schema::RESOURCE_TYPE]) }
  specify { expect(hash[:id]).to eql('Group') }
  specify { expect(hash[:description]).to eql(subject.description) }
  specify { expect(hash[:endpoint]).to eql(subject.endpoint) }
  specify { expect(hash[:name]).to eql(subject.name) }
  specify { expect(hash[:schema]).to eql(subject.schema) }
  specify { expect(hash[:schemaExtensions]).to match_array([]) }
end

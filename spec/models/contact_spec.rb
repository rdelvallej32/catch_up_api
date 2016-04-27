require 'rails_helper'

RSpec.describe Contact do
  def association
    described_class.reflect_on_association(:user)
  end

  it 'has an association with users' do
    expect(association).to_not be_nil
    expect(association.name).to eq(:user)
  end

  it 'has a set inverse_of record' do
    expect(association.options[:inverse_of]).to_not be_nil
    expect(association.options[:inverse_of]).to eq(:contacts)
  end

  it 'deletes contacts associated to users when deleted' do
    expect(association.options[:dependent]).to eq(:destroy)
  end

  it 'validates the presence of contact\'s title and content' do
    expect(
      Contact.create(
        first_name: 'Henry',
        last_name: 'Holmes',
        occupation: 'Professor',
        professional_relationship: 'Mentor',
        company: 'BU',
        last_contacted: '20120407',
        fact: 'Likes Pizza')
    ).to be_valid

    expect(
      Contact.create).to be_invalid
  end
end

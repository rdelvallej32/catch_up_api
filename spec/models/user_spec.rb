require 'rails_helper'

RSpec.describe User do
  def association
    described_class.reflect_on_association(:contacts)
  end

  it 'has an association with contacts' do
    expect(association).to_not be_nil
    expect(association.name).to eq(:contacts)
  end

  it 'has a set inverse_of record' do
    expect(association.options[:inverse_of]).to_not be_nil
    expect(association.options[:inverse_of]).to eq(:user)
  end
end

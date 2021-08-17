require 'rails_helper'

RSpec.describe Role, type: :model do
  subject { described_class.new(name: 'buyer') }

  context 'When name is not valid' do
    it do
      subject.name = nil
      expect(subject).to_not be_valid

      subject.name = ''
      expect(subject).to_not be_valid

      subject.name = ' '
      expect(subject).to_not be_valid
    end
  end

  context 'When all attributes are valid' do
    it { expect(subject).to be_valid }
  end

  context 'Associations' do
    it { expect(described_class.reflect_on_association(:user_role).macro).to eq :belongs_to }
  end
end

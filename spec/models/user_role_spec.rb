require 'rails_helper'

RSpec.describe UserRole, type: :model do
  subject do
    described_class.new(
      role_id: 1,
      user_id: 1
    )
  end

  context 'When role id is not valid' do
    it do
      subject.role_id = nil
      expect(subject).to_not be_valid

      subject.role_id = ''
      expect(subject).to_not be_valid

      subject.role_id = ' '
      expect(subject).to_not be_valid
    end
  end

  context 'When user id is not valid' do
    it do
      subject.user_id = nil
      expect(subject).to_not be_valid

      subject.user_id = ''
      expect(subject).to_not be_valid

      subject.user_id = ' '
      expect(subject).to_not be_valid
    end
  end

  context 'When all attributes are valid' do
    it { expect(subject).to be_valid }
  end

  context 'Associations' do
    it { expect(described_class.reflect_on_association(:roles).macro).to eq :has_many }

    it { expect(described_class.reflect_on_association(:users).macro).to eq :has_many }
  end
end

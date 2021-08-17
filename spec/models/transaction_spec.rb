require 'rails_helper'

RSpec.describe Transaction, type: :model do
  subject do
    described_class.new(
      transaction_type: 'buy',
      value: 10000,
      user_id: 1
    )
  end

  context 'When transaction type is not valid' do
    it do
      subject.transaction_type = nil
      expect(subject).to_not be_valid

      subject.transaction_type = ''
      expect(subject).to_not be_valid

      subject.transaction_type = ' '
      expect(subject).to_not be_valid
    end
  end

  context 'When value is not valid' do
    it do
      subject.value = nil
      expect(subject).to_not be_valid

      subject.value = ''
      expect(subject).to_not be_valid

      subject.value = ' '
      expect(subject).to_not be_valid

      subject.value = -0.01
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
    it { expect(described_class.reflect_on_association(:user).macro).to eq :belongs_to }

    it { expect(described_class.reflect_on_association(:stock).macro).to eq :belongs_to }
  end
end

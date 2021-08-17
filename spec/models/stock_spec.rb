require 'rails_helper'

RSpec.describe Stock, type: :model do
  subject do
    described_class.new(
      company_name: 'avion',
      price: 10000,
      market_cap: 10000000
    )
  end

  context 'When company name is not valid' do
    it do
      subject.company_name = nil
      expect(subject).to_not be_valid

      subject.company_name = ''
      expect(subject).to_not be_valid

      subject.company_name = ' '
      expect(subject).to_not be_valid
    end
  end

  context 'When price is not valid' do
    it do
      subject.price = nil
      expect(subject).to_not be_valid

      subject.price = ''
      expect(subject).to_not be_valid

      subject.price = ' '
      expect(subject).to_not be_valid

      subject.price = -0.01
      expect(subject).to_not be_valid

      subject.price = subject.market_cap + 0.01
      expect(subject).to_not be_valid
    end
  end

  context 'When market cap is not valid' do
    it do
      subject.market_cap = nil
      expect(subject).to_not be_valid

      subject.market_cap = ''
      expect(subject).to_not be_valid

      subject.market_cap = ' '
      expect(subject).to_not be_valid

      subject.market_cap = -0.01
      expect(subject).to_not be_valid

      subject.market_cap = subject.price - 0.01
      expect(subject).to_not be_valid
    end
  end

  context 'When all attributes are valid' do
    it { expect(subject).to be_valid }
  end

  context 'Associations' do
    it { expect(described_class.reflect_on_association(:user).macro).to eq :belongs_to }
  end
end

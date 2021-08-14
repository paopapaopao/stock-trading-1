require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(
      user_type: 'buyer',
      email: 'juan.dlc@example.com',
      password: 'password',
      first_name: 'juan',
      last_name: 'dela cruz'
    )
  end

  let :existing_user do
    described_class.create(
      user_type: 'broker',
      email: 'juan.dlc@example.com',
      password: 'password',
      first_name: 'juan',
      last_name: 'de la cruz'
    )
  end

  context 'When user type is not valid' do
    it do
      subject.user_type = nil
      expect(subject).to_not be_valid

      subject.user_type = ''
      expect(subject).to_not be_valid
    end
  end

  context 'When email is not valid' do
    it do
      subject.email = nil
      expect(subject).to_not be_valid

      subject.email = ''
      expect(subject).to_not be_valid

      existing_user
      expect(subject).to_not be_valid
    end
  end

  context 'When password is not valid' do
    it do
      subject.password = nil
      expect(subject).to_not be_valid

      subject.password = ''
      expect(subject).to_not be_valid

      subject.password = 'a' * 9
      expect(subject).to_not be_valid

      subject.password = 'a' * 101
      expect(subject).to_not be_valid
    end
  end

  context 'When first name is not valid' do
    it do
      subject.first_name = nil
      expect(subject).to_not be_valid

      subject.first_name = ''
      expect(subject).to_not be_valid
    end
  end

  context 'When last name is not valid' do
    it do
      subject.last_name = nil
      expect(subject).to_not be_valid

      subject.last_name = ''
      expect(subject).to_not be_valid
    end
  end

  context 'When all attributes are valid' do
    it { expect(subject).to be_valid }
  end

  context 'Associations' do
    it { expect(User.reflect_on_association(:transactions).macro).to eq :has_many }

    it { expect(User.reflect_on_association(:stocks).macro).to eq :has_many }
  end
end

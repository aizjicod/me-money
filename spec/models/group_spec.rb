require 'rails_helper'

RSpec.describe Group, type: :model do
  before :each do
    @user = User.create!(id: 1, name: 'Alejandro', email: 'test@test.com', password: '123123',
                         password_confirmation: '123123')
  end
  subject do
    Group.create(
      name: 'Game',
      icon: 'Icon',
      user_id: @user.id
    )
  end
  before { subject.save }

  describe 'validate data' do
    it 'it should have a name' do
      expect(subject.name).to eq 'Game'
    end

    it 'it should have a invalid name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'shouldnt have a valid icon' do
      expect(subject).to be_valid
    end

    it 'shouldnt be valid' do
      subject.icon = nil
      expect(subject).to_not be_valid
    end

    it 'should have user with id 1' do
      expect(subject.user.id).to eq 1
    end
  end
end

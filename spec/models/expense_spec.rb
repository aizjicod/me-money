require 'rails_helper'

RSpec.describe Expense, type: :model do
  before :each do
    @user = User.create(id: 1, name: 'Testo', email: 'test@test.com', password: '12345678')
    Group.create(id: 1, name: 'Name', icon: 'Icon', user_id: @user.id)
  end
  subject do
    Expense.new(name: 'Picasso', amount: rand(99..3333), group_ids: 1, user_id: 1)
  end
  before { subject.save }

  describe 'validate data' do
    it 'it should have a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should have an amount' do
      subject.amount = nil
      expect(subject).to_not be_valid
    end

    it 'should have user with id 1' do
      expect(subject.user.id).to eq 1
    end

    it 'should have group with id 1' do
      expect(subject.groups.first.id).to eq 1
    end

    it 'the amount should be numerical' do
      subject.amount = 'this should be a number'
      expect(subject).to_not be_valid
    end
  end
end

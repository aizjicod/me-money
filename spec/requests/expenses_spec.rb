require 'rails_helper'

RSpec.describe 'Expenses', type: :request do
  before :each do
    @user = User.create(name: 'Alejandro Torres', email: 'test@example.com', password: '123123',
                        password_confirmation: '123123')
    @group = Group.create(name: 'Games', icon: 'GameIcon', user: @user)
    @expense = Expense.create(name: 'Games', amount: 1000, user: @user)
    @expense.groups << @group
    sign_in @user
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_group_expense_path(@group)
      expect(response).to be_successful
    end
  end
end

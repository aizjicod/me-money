module GroupsHelper
  def get_amount(group)
    sum = 0
    group.expenses.each do |expense|
      sum += expense.amount
    end
    sum
  end
end

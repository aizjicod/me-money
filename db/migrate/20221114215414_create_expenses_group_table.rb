class CreateExpensesGroupTable < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses_groups do |t|
      t.belongs_to :group
      t.belongs_to :expense

      t.timestamps
    end
  end
end

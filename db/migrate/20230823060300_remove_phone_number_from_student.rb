class RemovePhoneNumberFromStudent < ActiveRecord::Migration[7.0]
  def change
    remove_column :students, :phonenumber, :integer
  end
end

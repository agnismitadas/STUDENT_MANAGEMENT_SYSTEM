class AddPhoneNumberToStudent < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :phonenumber, :string
  end
end

class AddAddressDateOfBirthPhoneNumberToStudent < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :address, :string
    add_column :students, :dateOfbirth, :datetime
    add_column :students, :phonenumber, :integer
  end
end

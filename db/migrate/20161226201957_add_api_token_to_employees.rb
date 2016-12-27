class AddApiTokenToEmployees < ActiveRecord::Migration[5.0]
  def change
    add_column :employees, :api_token, :string
  end
end

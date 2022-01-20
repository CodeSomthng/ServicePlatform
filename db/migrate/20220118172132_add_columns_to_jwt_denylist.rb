class AddColumnsToJwtDenylist < ActiveRecord::Migration[6.1]
  def change
    add_reference :jwt_denylist, :user, foreign_key: true
    add_column :jwt_denylist, :aud, :string
    add_column :jwt_denylist, :remote_ip, :string
    add_column :jwt_denylist, :os_data, :string
    add_column :jwt_denylist, :browser_data, :string
    add_column :jwt_denylist, :device_data, :string
  end
end

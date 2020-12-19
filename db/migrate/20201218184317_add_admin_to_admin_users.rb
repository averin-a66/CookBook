class AddAdminToAdminUsers < ActiveRecord::Migration[6.0]
  def change
    user = AdminUser.new
    user.email = "dmin@example.com"
    user.password = "password"
    user.save
  end
end

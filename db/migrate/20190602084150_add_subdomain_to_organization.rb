class AddSubdomainToOrganization < ActiveRecord::Migration[5.2]
  def change
    add_column :organizations, :subdomain, :string, :length => 255
    remove_column :employees, :organization_id
  end
end

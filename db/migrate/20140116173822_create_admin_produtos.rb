class CreateAdminProdutos < ActiveRecord::Migration
  def change
    create_table :admin_produtos do |t|
      t.string :code
      t.text :name
      t.text :url
      t.float :price
      t.integer :nparcela
      t.float :vparcela
      t.string :image
      t.string :marca

      t.timestamps
    end
  end
end

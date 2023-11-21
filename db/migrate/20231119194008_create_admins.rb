class Admin < ActiveRecord::Migration[7.1]
  def change
    create_table :admin do |t|
      t.string :Nome
      t.string :Email
      t.string :Senha
      t.float :CPF
      t.float :Codigo
    end
  end
end

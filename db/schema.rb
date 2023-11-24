# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2023_11_19_194008) do
  create_table "admin", primary_key: "idADMIN", id: :integer, charset: "utf8", collation: "utf8_general_ci", force: :cascade do |t|
    t.string "Nome", null: false
    t.string "Email", null: false
    t.string "Senha", limit: 200, null: false
    t.string "CPF", limit: 200, null: false
    t.string "codigo", limit: 200
    t.index ["CPF"], name: "CPF_UNIQUE", unique: true
    t.index ["Email"], name: "Email_UNIQUE", unique: true
  end

  create_table "admins", charset: "utf8", collation: "utf8_general_ci", force: :cascade do |t|
    t.string "Nome"
    t.string "Email"
    t.string "Senha"
    t.float "CPF"
    t.float "Codigo"
  end

  create_table "clientes", primary_key: "idClientes", id: :integer, charset: "utf8", collation: "utf8_general_ci", force: :cascade do |t|
    t.string "Nome", null: false
    t.string "Endereco", null: false
    t.string "Telefone", null: false
    t.string "Email", null: false
    t.float "CPF", null: false
    t.index ["CPF"], name: "CPF_UNIQUE", unique: true
    t.index ["Email"], name: "Email_UNIQUE", unique: true
    t.index ["Nome"], name: "Nome_UNIQUE", unique: true
    t.index ["Telefone"], name: "Telefone_UNIQUE", unique: true
  end

  create_table "equipes", primary_key: "idEquipes", id: :integer, charset: "utf8", collation: "utf8_general_ci", force: :cascade do |t|
    t.string "Nome", null: false
    t.string "Descricao", null: false
    t.string "Especialidade", limit: 200, null: false
    t.integer "Mecanicos_idMecanicos", null: false
    t.index ["Mecanicos_idMecanicos"], name: "fk_Equipes_Mecanicos1_idx"
    t.index ["Nome"], name: "Nome_UNIQUE", unique: true
  end

  create_table "mecanicos", primary_key: "idMecanicos", id: :integer, charset: "utf8", collation: "utf8_general_ci", force: :cascade do |t|
    t.string "Nome", null: false
    t.string "Email", null: false
    t.string "Senha", limit: 200, null: false
    t.float "CPF", null: false
    t.string "Especialidade", limit: 155, null: false
    t.index ["CPF"], name: "CPF_UNIQUE", unique: true
    t.index ["Email"], name: "Email_UNIQUE", unique: true
  end

  create_table "ordens_servico", primary_key: "idOrdens_Servico", id: :integer, charset: "utf8", collation: "utf8_general_ci", force: :cascade do |t|
    t.datetime "Data_emissao", precision: nil, null: false
    t.datetime "Data_conclusao", precision: nil
    t.float "Valor", null: false
    t.string "Servico_descricao", limit: 300, null: false
    t.column "Status", "enum('pendente','em_andamento','concluido')", null: false
    t.integer "Pecas_idPecas", null: false
    t.integer "Equipes_idEquipes", null: false
    t.integer "Veiculos_idVeiculos", null: false
    t.integer "Clientes_idClientes", null: false
    t.datetime "Data_prevista", precision: nil, null: false
    t.index ["Clientes_idClientes"], name: "fk_Ordens_Servico_Clientes1_idx"
    t.index ["Equipes_idEquipes"], name: "fk_Ordens_Servico_Equipes1_idx"
    t.index ["Pecas_idPecas"], name: "fk_Ordens_Servico_Pecas1_idx"
    t.index ["Veiculos_idVeiculos"], name: "fk_Ordens_Servico_Veiculos1_idx"
  end

  create_table "pecas", primary_key: "idPecas", id: :integer, charset: "utf8", collation: "utf8_general_ci", force: :cascade do |t|
    t.integer "Quantidade", null: false
    t.string "Tipo_peca", limit: 150, null: false
    t.float "Valor_peca", null: false
  end

  create_table "veiculos", primary_key: "idVeiculos", id: :integer, charset: "utf8", collation: "utf8_general_ci", force: :cascade do |t|
    t.string "Placa", null: false
    t.string "Modelo", null: false
    t.string "Cor", null: false
    t.date "Ano", null: false
    t.integer "Clientes_idClientes", null: false
    t.index ["Clientes_idClientes"], name: "fk_Veiculos_Clientes_idx"
    t.index ["Placa"], name: "Placa_UNIQUE", unique: true
  end

  add_foreign_key "equipes", "mecanicos", column: "Mecanicos_idMecanicos", primary_key: "idMecanicos", name: "fk_Equipes_Mecanicos1"
  add_foreign_key "ordens_servico", "clientes", column: "Clientes_idClientes", primary_key: "idClientes", name: "fk_Ordens_Servico_Clientes1"
  add_foreign_key "ordens_servico", "equipes", column: "Equipes_idEquipes", primary_key: "idEquipes", name: "fk_Ordens_Servico_Equipes1"
  add_foreign_key "ordens_servico", "pecas", column: "Pecas_idPecas", primary_key: "idPecas", name: "fk_Ordens_Servico_Pecas1"
  add_foreign_key "ordens_servico", "veiculos", column: "Veiculos_idVeiculos", primary_key: "idVeiculos", name: "fk_Ordens_Servico_Veiculos1"
  add_foreign_key "veiculos", "clientes", column: "Clientes_idClientes", primary_key: "idClientes", name: "fk_Veiculos_Clientes"
end

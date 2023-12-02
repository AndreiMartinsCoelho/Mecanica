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

ActiveRecord::Schema[7.1].define(version: 0) do
  create_table "admins", primary_key: "idADMIN", id: :integer, charset: "utf8", collation: "utf8_general_ci", force: :cascade do |t|
    t.string "Nome", null: false
    t.string "Email", null: false
    t.string "Senha", limit: 200, null: false
    t.string "CPF", limit: 200, null: false
    t.string "Codigo", limit: 45
    t.index ["CPF"], name: "CPF_UNIQUE", unique: true
    t.index ["Email"], name: "Email_UNIQUE", unique: true
  end

  create_table "clientes", primary_key: "idClientes", id: :integer, charset: "utf8", collation: "utf8_general_ci", force: :cascade do |t|
    t.string "Nome", null: false
    t.string "Endereco", null: false
    t.string "Telefone", null: false
    t.string "Email", null: false
    t.string "CPF", limit: 200, null: false
    t.index ["CPF"], name: "CPF_UNIQUE", unique: true
    t.index ["Email"], name: "Email_UNIQUE", unique: true
    t.index ["Nome"], name: "Nome_UNIQUE", unique: true
    t.index ["Telefone"], name: "Telefone_UNIQUE", unique: true
  end

  create_table "equipes", primary_key: "idEquipes", id: :integer, charset: "utf8", collation: "utf8_general_ci", force: :cascade do |t|
    t.string "Nome", null: false
    t.string "Descricao", null: false
    t.string "Especialidade", limit: 200, null: false
    t.index ["Nome"], name: "Nome_UNIQUE", unique: true
  end

  create_table "mecanicos", primary_key: "idMecanicos", id: :integer, charset: "utf8", collation: "utf8_general_ci", force: :cascade do |t|
    t.string "Nome", null: false
    t.string "Email", null: false
    t.string "CPF", limit: 200, null: false
    t.string "Especialidade", limit: 155, null: false
    t.index ["CPF"], name: "CPF_UNIQUE", unique: true
    t.index ["Email"], name: "Email_UNIQUE", unique: true
  end

  create_table "mecanicos_equipes", id: false, charset: "utf8", collation: "utf8_general_ci", force: :cascade do |t|
    t.integer "mecanico_id"
    t.integer "equipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ordens_servico", primary_key: "idOrdens_Servico", id: :integer, charset: "utf8", collation: "utf8_general_ci", force: :cascade do |t|
    t.datetime "Data_emissao", precision: nil, null: false
    t.datetime "Data_conclusao", precision: nil, null: false
    t.float "Valor", null: false
    t.float "Mao_obra", null: false
    t.string "Servico_descricao", limit: 300, null: false
    t.column "Status", "enum('pendente','em_andamento','concluido')", null: false
    t.integer "Equipes_idEquipes", null: false
    t.integer "Veiculos_idVeiculos", null: false
    t.integer "Clientes_idClientes", null: false
    t.index ["Clientes_idClientes"], name: "fk_Ordens_Servico_Clientes1_idx"
    t.index ["Equipes_idEquipes"], name: "fk_Ordens_Servico_Equipes1_idx"
    t.index ["Veiculos_idVeiculos"], name: "fk_Ordens_Servico_Veiculos1_idx"
  end

  create_table "pecas", primary_key: "idPecas", id: :integer, charset: "utf8", collation: "utf8_general_ci", force: :cascade do |t|
    t.integer "Quantidade", null: false
    t.string "Tipo_peca", limit: 150, null: false
    t.float "Valor_peca", null: false
  end

  create_table "pecas_has_ordens_servico", primary_key: ["pecas_idPecas", "ordens_servico_idOrdens_Servico"], charset: "utf8", collation: "utf8_general_ci", force: :cascade do |t|
    t.integer "pecas_idPecas", null: false
    t.integer "ordens_servico_idOrdens_Servico", null: false
    t.index ["ordens_servico_idOrdens_Servico"], name: "fk_pecas_has_ordens_servico_ordens_servico1_idx"
    t.index ["pecas_idPecas"], name: "fk_pecas_has_ordens_servico_pecas1_idx"
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

  add_foreign_key "ordens_servico", "clientes", column: "Clientes_idClientes", primary_key: "idClientes", name: "fk_Ordens_Servico_Clientes1"
  add_foreign_key "ordens_servico", "equipes", column: "Equipes_idEquipes", primary_key: "idEquipes", name: "fk_Ordens_Servico_Equipes1"
  add_foreign_key "ordens_servico", "veiculos", column: "Veiculos_idVeiculos", primary_key: "idVeiculos", name: "fk_Ordens_Servico_Veiculos1"
  add_foreign_key "pecas_has_ordens_servico", "ordens_servico", column: "ordens_servico_idOrdens_Servico", primary_key: "idOrdens_Servico", name: "fk_pecas_has_ordens_servico_ordens_servico1"
  add_foreign_key "pecas_has_ordens_servico", "pecas", column: "pecas_idPecas", primary_key: "idPecas", name: "fk_pecas_has_ordens_servico_pecas1"
  add_foreign_key "veiculos", "clientes", column: "Clientes_idClientes", primary_key: "idClientes", name: "fk_Veiculos_Clientes"
end

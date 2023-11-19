json.extract! admin, :id, :Nome, :Email, :Senha, :CPF, :Codigo, :created_at, :updated_at
json.url admin_url(admin, format: :json)

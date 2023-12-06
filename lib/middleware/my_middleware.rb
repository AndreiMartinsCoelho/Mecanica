class MyMiddleware
  def initialize(app)
    @app = app
  end

  def call env

  end
end

# config/application.rb
config.middleware.use MyMiddleware

# config/environments/production.rb
config.middleware.use MyMiddleware

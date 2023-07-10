class Hello
  def initialize(app)
    @app = app
  end

  def call(env)
    code, headers, body = @app.call(env)
    p "++++++++++++HelloMiddleware++++++++++++"
    [code, headers, body]
  end
end

App = lambda do |env|
  [200, {"Content-Type" => "text/html"}, ["Hello, Rack world!"]]
end

Rails.application.config.middleware.use Hello

class UpcaseAll
  def initialize(app)
    @app = app
  end

  def call(env)
    status_code, headers, body = @app.call(env)
    body.each{|part| part.upcase!}
    [status_code, headers, body]
  end
end

use UpcaseAll

App = lambda do |env|
  p "aaadfaosdifjoaisjdfoijasdfoij"
  p env
  [200, {"Content-Type" => "text/plain"}, ["Hello World!"]]
end
run App

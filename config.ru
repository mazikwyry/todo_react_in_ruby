# config.ru
require 'bundler'
Bundler.require

opal = Opal::Server.new {|s|
  s.append_path 'app'
  s.main = 'todo_app'
}

sprockets   = opal.sprockets
prefix      = '/assets'
maps_prefix = '/__OPAL_SOURCE_MAPS__'
maps_app    = Opal::SourceMapServer.new(sprockets, maps_prefix)

# Monkeypatch sourcemap header support into sprockets
::Opal::Sprockets::SourceMapHeaderPatch.inject!(maps_prefix)

map maps_prefix do
  run maps_app
end

map prefix do
  run sprockets
end

get '/' do
  <<-HTML
    <!doctype html>
    <html>
      <head>
        <title>Hello React</title>
        <link rel="stylesheet" href="base.css" />
        #{::Opal::Sprockets.javascript_include_tag('todo_app', sprockets: sprockets, prefix: prefix, debug: true)}
      </head>
      <body>
        <div id="content"></div>
      </body>
    </html>
  HTML
end

run Sinatra::Application

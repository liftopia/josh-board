# encoding: utf-8
require 'json'

last_change = Integer(ENV['LAST_CHANGE'] || 1394837700)
max = Integer(ENV['MAX'] || 0)

run lambda { |env|
  [
    200,
    {
      'Content-Type' => 'text/json'
    },
    StringIO.new(
      {
        "item" => (Time.now - last_change).to_i / 86400,
        "min" => {
          "text" => 'Min',
          "value" => 0
        },
        "max" => {
          "text" => 'Max',
          "value" => [ (Time.now - last_change).to_i / 86400, max ].max
        }
      }.to_json
    )
  ]
}

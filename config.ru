# encoding: utf-8
require 'json'

last_change = Integer(ENV['LAST_CHANGE'] || 1394837700)
max = Float(ENV['MAX'] || 0.0)

run lambda { |env|
  [
    200,
    {
      'Content-Type' => 'text/json'
    },
    StringIO.new(
      {
        "item" => ((Time.now - last_change).to_f / 86400).round(2),
        "min" => {
          "text" => 'Min',
          "value" => 0
        },
        "max" => {
          "text" => 'Max',
          "value" => [ ((Time.now - last_change).to_f / 86400).round(2), max ].max
        }
      }.to_json
    )
  ]
}

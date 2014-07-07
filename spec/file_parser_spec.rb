require 'spec_helper'
require_relative '../lib/file_parser'

describe FileParser do
  it 'converts the data to a hash' do
    input = [
        ["Elsa", 2, "Wednesday", "Drive", 30, 50, 24],
        ["Bob", 2, "Wednesday", "Drive", 30, 50, 24],
    ]

    actual = {
        "Bob" => {
            week: 2,
            day: "Wednesday",
            mode: "Drive",
            inbound: 30,
            outbound: 50,
            distance: 24
        },
        "Elsa" => {
            week: 2,
            day: "Wednesday",
            mode: "Drive",
            inbound: 30,
            outbound: 50,
            distance: 24
        }
    }

    expect(FileParser.new.to_hash(input)).to eq actual
  end
end
require 'spec_helper'
require_relative '../lib/file_parser'

describe FileParser do
  it 'converts the data to a hash' do
    input = [
        ["Elsa", 2, "Wednesday", "Drive", 30, 50, 24],
        ["Bob", 2, "Wednesday", "Drive", 30, 50, 24],
    ]

    actual = {
        "Bob" => [{
            week: 2,
            day: "Wednesday",
            mode: "Drive",
            inbound: 30,
            outbound: 50,
            distance: 24
        }],
        "Elsa" => [{
            week: 2,
            day: "Wednesday",
            mode: "Drive",
            inbound: 30,
            outbound: 50,
            distance: 24
        }]
    }

    expect(FileParser.new(input).to_hash).to eq actual
  end

  it 'can sort rows per person' do
    input = [
        ["Elsa", 2, "Wednesday", "Drive", 30, 50, 24],
        ["Elsa", 1, "Wednesday", "Bike", 10, 20, 14],
        ["Elsa", 1, "Tuesday", "Bike", 10, 20, 14],
        ["Elsa", 1, "Monday", "Bike", 10, 20, 14],
        ["Elsa", 1, "Friday", "Bike", 10, 20, 14],
        ["Elsa", 1, "Thursday", "Bike", 10, 20, 14],
    ]

    actual = {
        "Elsa" => [
            {
                week: 1,
                day: "Monday",
                mode: "Bike",
                inbound: 10,
                outbound: 20,
                distance: 14
            },
            {
                week: 1,
                day: "Tuesday",
                mode: "Bike",
                inbound: 10,
                outbound: 20,
                distance: 14
            },
            {
                week: 1,
                day: "Wednesday",
                mode: "Bike",
                inbound: 10,
                outbound: 20,
                distance: 14
            },
            {
                week: 1,
                day: "Thursday",
                mode: "Bike",
                inbound: 10,
                outbound: 20,
                distance: 14
            },
            {
                week: 1,
                day: "Friday",
                mode: "Bike",
                inbound: 10,
                outbound: 20,
                distance: 14
            },
            {
                week: 2,
                day: "Wednesday",
                mode: "Drive",
                inbound: 30,
                outbound: 50,
                distance: 24
            },
        ]
    }

    expect(FileParser.new(input).sort_by_week).to eq(actual)
  end
end
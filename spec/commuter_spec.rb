require 'spec_helper'
require_relative '../lib/commuter'

describe Commuter do
  it 'returns a report as a hash' do
    csv_data = File.open('/Users/elsaschneiders/gSchoolWork/commute-warm-up-1/data/gschool_practice_data.csv')

    commute_hash = Commuter.new(csv_data).to_hash

    expected_value = {"Emily" =>[{
        week: 4,
        day: "Monday",
        mode: "Walk",
        inbound: 12,
        outbound: 15,
        distance: 0.65
    }]
    }
    expect(commute_hash).to eq expected_value
  end
end

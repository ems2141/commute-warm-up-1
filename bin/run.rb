require_relative '../lib/file_reader'
require_relative '../lib/file_parser'

data = FileReader.new('/Users/elsaschneiders/gSchoolWork/commute-warm-up-1/data/gschool_commute_data.csv').read_data

p data

hashed = FileParser.new(data).sort_by_week

p hashed

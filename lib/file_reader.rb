class FileReader
  def initialize(file)
    @file = file
  end

  def read_data
    data = File.open(@file)
    lines = File.readlines(data)

    output = []
    lines.each do |line|
      output << line.split(",")
    end
    output.shift
    output.each do |row|
      row[1] = row[1].to_i
      row[4] = row[4].to_i
      row[5] = row[5].to_i
      row[6] = row[6].to_i
    end
    output
  end
end
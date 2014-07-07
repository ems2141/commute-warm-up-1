class FileParser

  def to_hash(data)
    output = {}
    data.each do |data|
      output[data[0]] = {
          week: data[1],
          day: data[2],
          mode: data[3],
          inbound: data[4],
          outbound: data[5],
          distance: data[6]
      }
    end
    output
  end

end
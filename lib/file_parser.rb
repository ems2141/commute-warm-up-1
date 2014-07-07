class FileParser

  def initialize(data)
    @data = data
  end

  def to_hash

    output = {}

    @data.each do |data|

      if output[data[0]].nil?
        output[data[0]] = [{
                               week: data[1],
                               day: data[2],
                               mode: data[3],
                               inbound: data[4],
                               outbound: data[5],
                               distance: data[6]
                           }]

      else
        output[data[0]] << {
            week: data[1],
            day: data[2],
            mode: data[3],
            inbound: data[4],
            outbound: data[5],
            distance: data[6]
        }
      end

    end
    output
  end

  def sort_by_week
    to_hash.each do |key, value|
      value.sort_by! do |hash|
        date_sort = Date.parse(hash[:day]).wday
        [hash[:week], date_sort]
      end
    end
  end
end
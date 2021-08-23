module SmartParser
  class DataLoader
    attr_reader :data_lines, :filename

    def initialize(filename)
      raise 'Filename is not set for data load!' if filename.nil?
      @filename = filename
    end

    def data_lines
      @data_lines ||= File.readlines(@filename).map{|line| line.split(' ') }
    end
  end
end

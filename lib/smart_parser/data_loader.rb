module SmartParser
  class DataLoader
    attr_reader :data_lines, :filename

    def initialize(filename)
      raise 'Filename is not set for data load!' if filename.nil?
      @filename = filename
    end

    def data_lines
      raise 'File does not exist' unless File.file?(@filename)
      raise 'File is empty' if File.zero?(@filename)
      raise 'File has wrong format. Please, use text file.' if File.binary?(@filename)

      @data_lines ||= File.readlines(@filename).map{|line| line.split(' ') }
    end
  end
end

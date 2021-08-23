require "smart_parser"
puts ARGV

data_loader = SmartParser::DataLoader.new('webserver.log')
SmartParser::Report.new(data_lines: data_loader.data_lines).perform


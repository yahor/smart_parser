require "smart_parser"
puts 'Reading file...'
puts ARGV

data_loader = SmartParser::DataLoader.new(ARGV[0])
SmartParser::Report.new(data_lines: data_loader.data_lines).perform


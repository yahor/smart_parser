# frozen_string_literal: true

require 'test_helper'

class SmartParserTest < Minitest::Test
  def setup
    data_loader = SmartParser::DataLoader.new('webserver.log')
    @smart_parser = SmartParser::Report.new(data_lines: data_loader.data_lines)
  end

  def test_perform
    result = @smart_parser.perform

    assert_equal(true, result)
  end
end

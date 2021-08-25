# frozen_string_literal: true

require 'test_helper'

class DataLoaderTest < Minitest::Test
  def setup
    @data_loader = SmartParser::DataLoader.new('webserver.log')
  end

  def test_new
    assert_equal(@data_loader.filename, 'webserver.log')
  end

  def test_no_filename
    exception = assert_raises(RuntimeError) {SmartParser::DataLoader.new(nil)}
    assert_equal('Filename is not set for data load!', exception.message)
  end

  def test_file_not_exist
    exception = assert_raises(RuntimeError) {SmartParser::DataLoader.new('test.txt').data_lines}
    assert_equal('File does not exist', exception.message)
  end

  def test_datalines
    data_lines = @data_loader.data_lines

    assert_equal(data_lines.first, ["/help_page/1", "126.318.035.038"])
  end
end

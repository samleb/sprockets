require "test_helper"

class ConcatenationTest < Test::Unit::TestCase
  def setup
    @concatenation = Sprockets::Concatenation.new
    @environment = environment_for_fixtures
  end
  
  def test_record
    assert_equal [], @concatenation.source_lines
    assert_equal "hello\n", @concatenation.record(source_line("hello\n")).to_s
    assert_equal "world\n", @concatenation.record(source_line("world\n")).to_s
    assert_equal ["hello\n", "world\n"], @concatenation.source_lines.map { |source_line| source_line.to_s }
  end
  
  def test_to_s
    @concatenation.record(source_line("hello\n"))
    @concatenation.record(source_line("world\n"))
    assert_equal "hello\nworld\n", @concatenation.to_s
  end
end

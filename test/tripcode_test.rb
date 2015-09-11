# -*- coding: utf-8 -*-
require 'test_helper'

class TripcodeTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Tripcode::VERSION
  end

  def test_nil_passwords
    assert_equal '', Tripcode.hash(nil)
    assert_equal '', Tripcode.secure(nil)
  end

  def test_blank_passwords
    assert_equal '', Tripcode.hash('')
    assert_equal '', Tripcode.secure('')
  end

  def test_hash_general
    assert_equal 'BpZUCmJAIQ', Tripcode.hash('!@#$%^&*')
    assert_equal 'WALqTeQmv2', Tripcode.hash('$$')
    assert_equal 'LLVegDyAFo', Tripcode.hash('@@')
    assert_equal 'RYRu.UCnt.', Tripcode.hash('""')
    assert_equal '74O3p/8R3A', Tripcode.hash('\'"')
    assert_equal 'c8eDXvwFLQ', Tripcode.hash('訛')
    assert_equal 'Ez2xakpO4w', Tripcode.hash('ルビ')
    assert_equal 'Qy1ldS1UD.', Tripcode.hash('红宝石')
  end
 
  def test_secure_general
    assert_equal 'gIkNUlZvepz21nd', Tripcode.secure('!@#$%^&*')
    assert_equal '6YFELeXy+hHKkK+', Tripcode.secure('$$')
    assert_equal 'a07Y6CsRRT06TbR', Tripcode.secure('@@')
    assert_equal 'rTtIRSZbWpvDV7A', Tripcode.secure('""')
    assert_equal '9Bo4QF25AoV+Cmv', Tripcode.secure('\'"')
    assert_equal 'E++UhjAB7NF9q0m', Tripcode.secure('訛')
    assert_equal 'v/J4kNSJHdqGdcp', Tripcode.secure('ルビ')
    assert_equal 'G0nBWic9ldnq2yu', Tripcode.secure('红宝石')
  end 

  def test_parse
    assert_equal ['', '', ''], Tripcode.parse('')
    assert_equal ['', '', ''], Tripcode.parse('####')
    assert_equal ['', "Mn5mzn8hAQ", ''], Tripcode.parse('#ruby')
    assert_equal ['User', '', 'y65WdWQD6Zze1n3'], Tripcode.parse('User##password')
    assert_equal ['User', 'ozOtJW9BFA', ''], Tripcode.parse('User#password')
  end

  def test_bulk_tripcodes
    File.open('./test/tripcodes.txt', 'r') do |f|
      f.each_line do |line|
        input, output = line.strip.split('!')
        assert_equal output, Tripcode.hash(input)
      end
    end
  end
end

# -*- coding: utf-8 -*-
require 'test_helper'

class TripcodeTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Tripcode::VERSION
  end

  def test_nil_passwords
    assert_equal "", Tripcode.hash(nil)
  end

  def test_blank_passwords
    assert_equal "", Tripcode.hash("")
  end

  def test_symbols
    assert_equal 'KNs1o0VDv6', Tripcode.hash('!')
    assert_equal 'z0MWdctOjE', Tripcode.hash('@')
    assert_equal 'u2YjtUz8MU', Tripcode.hash('#')
    assert_equal 'yflOPYrGcY', Tripcode.hash('$')
    assert_equal '1t98deumW.', Tripcode.hash('%')
    assert_equal 'gBeeWo4hQg', Tripcode.hash('^')
    assert_equal 'MhCJJ7GVT.', Tripcode.hash('&')
    assert_equal 'o8gKYE6H8A', Tripcode.hash('*')
    assert_equal 'SGn2Wwr9CY', Tripcode.hash('(')
    assert_equal 'E9k1wjKgHI', Tripcode.hash(')')
    assert_equal 'IHLbs/YhoA', Tripcode.hash('+')
    assert_equal 'YeQQgdCJE6', Tripcode.hash(',')
    assert_equal 'tHbGiobWdM', Tripcode.hash('-')
    assert_equal 'XONm83jaIU', Tripcode.hash('.')
    assert_equal 'DGAVybFN0A', Tripcode.hash('/')
    assert_equal '8/08awL.AE', Tripcode.hash('\'')
    assert_equal 'gt1azVccY2', Tripcode.hash('"')
    assert_equal "7h2f0/nQ3w", Tripcode.hash("[")
    assert_equal "rjM99frkZs", Tripcode.hash("]")
    assert_equal "odBt7a7lv6", Tripcode.hash("{")
    assert_equal "ATNP9hXHcg", Tripcode.hash("}")
    assert_equal ".BmRMKOub2", Tripcode.hash(":")
    assert_equal "zglc7ct1Ls", Tripcode.hash(";")
    assert_equal "cPUZU5OGFs", Tripcode.hash("?")
    assert_equal "l.nT/qC3Ro", Tripcode.hash("`")
    assert_equal "LpJR0bXBSc", Tripcode.hash("~")
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

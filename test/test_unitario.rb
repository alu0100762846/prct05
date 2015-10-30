#!/usr/bin/ruby

require "./racional.rb"
require "test/unit"

class Test_Fraccion < Test::Unit::TestCase

	def test_simple
		assert_equal("1/5", Fraccion.new(1,5).to_s)
		assert_not_equal("1/5", Fraccion.new(5,5).to_s)
	end

	def test_failure
		assert_equal("1,5", Fraccion.new(1,5).to_s)
	end

	def type_check
		assert_raise(RuntimeError){-Fraccion.new('1','5')}
	end

end
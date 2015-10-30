#!/usr/bin/ruby

# Implementar en este fichero la clase para crear objetos racionales

require "./gcd.rb"
require "./mcm.rb"

class Fraccion

	attr_reader :num, :den

	def initialize (num, den)
		@num, @den = num, den
	end
	
	def initialize (num, den)
		@num, @den = num, den						#Definimos las variables
	end

	def to_s
		"#{@num}/#{@den}"						#Muestra numerador/denominador
	end
	
end
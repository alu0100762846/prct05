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
	
	def reducir (fraccion)
		res_max = gcd(fraccion.num, fraccion.den)			#Hallamos el MCD entre el numerador y denominador
		Fraccion.new(fraccion.num/res_max, fraccion.den/res_max)
	end
	
	def + (fraccion)
		res_min = mcm(@den, fraccion.den)				#Calculamos el mcm de los denominadores
		suma = Fraccion.new((res_min/@den*@num)+(res_min/fraccion.den*fraccion.num), res_min) #Fraccion suma
		reducir (suma)							#Simplificamos el resultado
	end	

	def - (fraccion)
		res_min = mcm(@den, fraccion.den)				#Calculamos el mcm de los denominadores
		resta = Fraccion.new((res_min/@den*@num)-(res_min/fraccion.den*fraccion.num), res_min) 	#Fraccion resta
		reducir (resta)							#Simplificamos el resultado
	end	
	
end
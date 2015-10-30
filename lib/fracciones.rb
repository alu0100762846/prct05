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
	
	def * (fraccion)
		multiplicacion = Fraccion.new(@num*fraccion.num, @den*fraccion.den)
		reducir (multiplicacion)					#Simplificamos el resultado
	end
	
	def / (fraccion)
		division = Fraccion.new(@num*fraccion.den, @den*fraccion.num)
		reducir (division)						#Simplificamos el resultado
	end
	
end

#Pruebas

fraccion1 = Fraccion.new(1,3)		
fraccion2 = Fraccion.new (4,10)	
puts "Fraccion 1"
puts "#{fraccion1}"
puts "Fraccion 2"
puts "#{fraccion2}"

fraccion3 = fraccion1+fraccion2		
puts "Suma"
puts "#{fraccion3}"

fraccion3 = fraccion1-fraccion2		
puts "Resta"
puts "#{fraccion3}"


fraccion3 = fraccion1*fraccion2		
puts "Multiplicacion"
puts "#{fraccion3}"

fraccion3 = fraccion1/fraccion2		
puts "Division"
puts "#{fraccion3}"
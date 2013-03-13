class Application < ActiveRecord::Base
	include ActionView::Helpers::NumberHelper
  	self.abstract_class = true
  	# devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :timeoutable

	#  def timeout
	#      3.seconds
	#  end  s

	def valor
		valor_f
	end

	def valor_f=(valor)
		write_attribute(:valor,valor.to_s.gsub(/[\.\,R$ ]/,',' =>  '.' , '.' => '', 'R$ ' => '').to_f)

	end

	def valor_f
		number_to_currency_br(read_attribute(:valor)) 
	end

	def number_to_currency_br(number)
		number_to_currency(number, :unit => "R$ ", :separator => ",", :delimiter => ".", :format => "%u %n")
	end

end

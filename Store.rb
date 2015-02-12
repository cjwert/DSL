require 'singleton'
class Store
	attr_accessor :current_product
	include Singleton
	def initialize
		@products = []
#		load_rules(file)
	end
	
#	def load_rules(input) #file = File.open(input) #file.each_line do |line| # read in the file line by line #puts line # handle each line after reading it in #end
	#end
	
	def process_orders
		@products.each { |product| puts product }
	end
	
	def add_product(text)
		@products << text	
	end
	
	def run_store
	
	end
	
	
	def add_parameterized_process(text)
		temp = text.to_sym
	end
	
end

class Product
	attr_accessor :actions
	
	def initialize(name)
		@product_name = name
		@actions = []
	end
	
	def add_action(action)
		@actions << action
	end
	
	def to_s
		temp = @product_name
		if @actions.length > 0 
			@actions.each {|action| temp += " #{action}"}
		end
		return temp
	end

end

def product(text)
	#puts "Just read a product #{text}"
	temp = Product.new(text)
	Store.instance.add_product(temp)
	#puts Store.instance.current_product
	Store.instance.current_product = temp
end

def packing_slip(text)
	puts "Just read a packing slip #{text}"
end

def email(text)
	puts "Just read email #{text}"
end

def pay(text)
	puts "Just read pay #{text}"
end

def includes_free(text)
	puts "Just read  free #{text}"
end

def includes(text)
	puts "Just read include #{text}"
end

def notify(text)
	puts "Just read notify #{text}"
end

def activate
	puts "Just read activate"
end

load 'businessRules.txt'
puts "Printing all products and their actions"
Store.instance.process_orders

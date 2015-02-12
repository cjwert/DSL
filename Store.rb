class Store

	def initialize(file)
		@products = []
		load_rules(file)
	end
	
	def load_rules(input)
		file = File.open(input)
		file.each_line do |line| # read in the file line by line
			puts line # handle each line after reading it in
		end
	end
	
	def process_orders
	
	end
	
	def add_product
		
	end
	
	def run_store
	
	end
	
	
	def add_parameterized_process(text)
		temp = text.to_sym
	end
	
end

class Product
	#attr_reader actions
	
	def intialize(text)
		@product_name = text
	end
	
end

def product(text)
	puts text
end

demo = Store.new "businessRules.txt"
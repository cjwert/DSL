class Store

	def initialize(file)
		@products = []
#		load_rules(file)
	end
	
#	def load_rules(input)
		#file = File.open(input)
		#file.each_line do |line| # read in the file line by line
			#puts line # handle each line after reading it in
		#end
	#end
	
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
	puts "Just read a product #{text}"
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
demo = Store.new "businessRules.txt"


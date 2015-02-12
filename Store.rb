require 'singleton'
class Store
	attr_accessor :current_product
	include Singleton
	def initialize
		@products = Hash.new
#		load_rules(file)
	end
	
#	def load_rules(input) #file = File.open(input) #file.each_line do |line| # read in the file line by line #puts line # handle each line after reading it in #end
	#end
	
	def add_product(text)
		@products[text] = Array.new	
	end
	
	def add_action(action)
		@products[@current_product] << action
	end
	
	def run_store
		shopping = true
		while shopping == true
			print "Enter product type or 'quit' to end: "
			temp = gets.chomp
			if temp == "quit" then shopping = false else
				#puts @products.keys
				array = @products["video"]
				puts array
				#array.each{|action| puts "---- #{action}"}
			end
		end
	end
	
	
	def add_parameterized_process(text)
		temp = text.to_sym
	end
	
end

class Product
	attr_accessor :actions, :product_name	#makes public
	
	def initialize(name)
		@product_name = name
		@actions = []
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
	temp = Product.new(text.chomp)
	Store.instance.add_product(temp)
	#puts Store.instance.current_product
	Store.instance.current_product = temp
end

def packing_slip(text)
	Store.instance.add_action("packing slip for #{text}")
end

def email(text)
	Store.instance.add_action("email #{text}")
end

def pay(text)
	Store.instance.add_action("paying #{text}")
end

def includes_free(text)
	Store.instance.add_action("including free #{text}")
end

def includes(text)
	Store.instance.add_action("including #{text}")
end

def notify(text)
	Store.instance.add_action("notifying #{text}")
end

def activate
	Store.instance.add_action("activate #{Store.instance.current_product.product_name}")
end
#exception goes around this thing
load 'businessRules.txt'
Store.instance.run_store

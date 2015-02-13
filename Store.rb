require 'singleton'
class Store
	attr_accessor :current_product, :products	#make public

	include Singleton

	def initialize
		@products = Hash.new
	end
	
	def load_rules(file)
		begin
			load file 
		rescue NameError => ex
			err = ex.to_s[/`\w+\'/]
			err = err[1..err.length - 2]
			puts "Action in rules file is invalid: #{err}"
			raise ArgumentError
		end
	end

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
				if(Store.instance.products.keys.include? temp)
					@products.fetch(temp).each{|action| puts "---- #{action}"}
				else
					puts "Error: Product not defined"
				end
			end
			puts ""
		end
	end	
end


def product(text)
	temp = text.chomp
	if !Store.instance.products.keys.include? temp	#check if duplicate
		Store.instance.add_product(temp)
	end
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
	Store.instance.add_action("activate #{Store.instance.current_product}")
end


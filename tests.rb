require 'test/unit'
require "./Store"

class StoreTest < Test::Unit::TestCase

def test_rules
	Store.instance.load_rules("businessRules.txt")
	# test each product is present
	assert(Store.instance.products.include?("book"))
	assert(Store.instance.products.include?("boots"))
	assert(Store.instance.products.include?("pass"))
	assert(Store.instance.products.include?("video"))
	assert(Store.instance.products.include?("membership"))
	# test each action
	temp = Store.instance.products["book"]
	assert(temp.include?("packing slip for royalty"))
	assert(temp.include?("paying commission"))
	assert(Store.instance.products["membership"].include?("activate membership"))
	assert(Store.instance.products["boots"].include?("including certificate"))
	assert(Store.instance.products["video"].include?("including free first aid video"))
	assert(Store.instance.products["pass"].include?("email purchaser"))
	assert(Store.instance.products["pass"].include?("notifying ski resort"))
end

def test_exception_thrown
	# test that an exception is thrown when loading an invalid rule
	assert_raise(ArgumentError) { Store.instance.load_rules("badRules.txt") }
end

end

require './Store.rb'
Store.instance.load_rules("businessRules.txt") # load the rules
Store.instance.run_store # run the store

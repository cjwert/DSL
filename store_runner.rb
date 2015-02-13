require './Store.rb'
Store.instance.load_rules("businessRules.txt")
Store.instance.run_store

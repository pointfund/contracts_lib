class GuideController < ApplicationController
	def index

	end

	def start
		@records = Record.all
	end
	
	def map
		@contracts = Contract.all
	end
	
	def login
		 # :authenticate_user
	end

end

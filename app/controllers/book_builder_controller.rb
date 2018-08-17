require 'csv'  
class BookBuilderController < ApplicationController
	 def show
	  	# filename = File.read("app/assets/builddb/addbook.csv")
	  	imp_page_p = "app/assets/builddb/page_parts.csv"
	  	imp_page_l = "app/assets/builddb/page_layouts.csv"
	  	imp_page_b = "app/assets/builddb/books.csv"
	  	imp_page_c = "app/assets/builddb/contracts.csv"


	  	imp_page_d = "app/assets/builddb/contracts_3.csv"
	 

	# 	csv = CSV.new(filename, :headers => true, :header_converters => :symbol, :converters => [:all, :blank_to_nil])
			# csv.to_a.map {|row| puts row.to_hash }
	  	CSV.foreach(imp_page_b, :headers => true) do |row|
	  		# puts row
	  		Book.create!(row.to_hash)
		end

		CSV.foreach(imp_page_c, :headers => true) do |row|
	  		# puts row
	  		Contract.create!(row.to_hash)
		end	
		

		CSV.foreach(imp_page_p, :headers => true) do |row|
	  		# puts row
	  		PagePart.create!(row.to_hash)
		end
		
		CSV.foreach(imp_page_l, :headers => true) do |row|
	  		# puts row
	  		PageLayout.create!(row.to_hash)
		end

		CSV.foreach(imp_page_d, :headers => true) do |row|
	  		# puts row
	  		PageLayout.create!(row.to_hash)
		end
			
		# CSV.read('app/assets/builddb/addbook.csv').map {|a| Hash[ keys.zip(a) ]} 
		@books = Book.all
	  end

	  def edit
	  end

	  def edit
	  end
	end



end

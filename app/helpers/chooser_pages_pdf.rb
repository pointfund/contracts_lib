module ChooserPagesPdf
	class Chooser  
		def initialize()
			setBook()
		end

		def setBook
			puts "loaded set book "
			 if(@record_page_set != nil) 
      			@record_page_set = params[:book_c]
      			puts "set records from params"
			else
				puts "records not set  "
			end
		end

		def pageQue
		end

		def pageSetList

		end


		def addSinglePage(hold_add, record_page)
			case hold_add
		      when 1
		        record_page = record_page.to_s + "#{hold_add}" + ", "
		      when 2
		       	record_page = record_page.to_s + "#{hold_add}" + ", "
		      when 3
		        record_page = record_page.to_s + "#{hold_add}" + ", "
		      when 4..100
		        record_page = record_page.to_s + "#{hold_add}" + ", "
		      else
		        "Error: capacity has an invalid value (#{hold_add})"
		    end
		    return  record_page
		end

		def getBookPages(books, record_page_set)
	
			puts "Book Number : " + books.to_s + " new book  " + " found" + record_page_set.to_s 

			@contracts = Contract.where({:book_id => books})
			book_pages = ""
			# page = record_page_set.split(", ").uniq.to_s 
			# puts page + " and"

			if(@contracts.length >= 1)
				@contracts.each do |contract|
					book_pages = book_pages  + contract.id.to_s + ", "
					puts contract.name + " : contract "
					# addSinglePage(contract.id, record_page_set) 
				end
				# .@record_page_set =  record_page_set.to_s + book_pages.to_s  
			elsif(@contracts.length == 1)
				# @contracts.each do |contract|
				# 	# book_pages = book_pages  + contract.id.to_s
				# 	puts contract.name + " : contract " 
				# end
			else

			end
			puts book_pages + "pages from book "

			return book_pages
			# book_list = ""
			# if(book_list == nil)
			#   book_list = ""
			# end    
			# # if(params["book_call"] != nil)
			# #   # @book_list =  @book_list.push(params["book_call"])
			# # end
			# @book_list = "no"
			# if(params["book_c"] != nil)
			#   if(@book_list)
			#         @book_list = "" + @book_list + ", "+  params["book_c"]
			#          puts @book_list
			#          puts "set list"
			#     @book_list
			#   else
			#     @book_list = ""
			#     puts @book_list
			#     puts "sample set"
			#   end
			# end
		end

		def checkPages()

		end

	end
end
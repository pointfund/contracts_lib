class PdfPageController < ApplicationController
		# include PdfPagesHelper, PdfFontsHelper, ChooserPagesPdf
  def index
  	 @next = 0
        
        if(params[:add])
            @next = params[:add].to_i
            @my_record = params[:rec_id] +  @next
            @record = Record.find(@my_record.to_i)

        end
        
        if(params[:rec_id])
            @my_record = params[:rec_id]
            @record = Record.find(@my_record.to_i)

        else
            @record = Record.find(params[:id])        
        end
        
        @records = Record.all
        total_records =  @records.length
        @last_record = total_records - 1
        record = @record
        #    @image_tag = Array.new
        # @images = Dir.glob("app/assets/images/pf_base_btn_set/*.jpg")
        #  @form_pages = "<div class='page_samp'>#{@images[0]}</div>"
        #  @img_lib = @images.length

        show

  end

  def show
  	        new_book = Chooser.new
        @contracts = Contract.all
        # @books = Book.where({id: 2})
        @books = Book.all
        # @books = Book.find(1)  
        # pageQue = Chooser.new 
        if(params[:records])
            @record_page_set = params[:records]
        else 
            @record_page_set = ""    
        end
        # @record_page_set = ""
        holdpage_add = params["page"].to_i
        
        # @record_page_set = new_book.addSinglePage(params["page"].to_i, @record_page_set)
        # if()

        puts @record_page_set.to_s + "before set "
        @record_page_set = getParams(params, new_book, @record_page_set)
       
        # puts @page + " new"
        # @record_page_set = new_book.addSinglePage(@page, @record_page_set)
        puts @record_page_set.to_s + "after book set"
             count = 0
        # size of pdf lib 
        @book_page_set = @books.length
        
        # last selection 
        
        # puts holdpage_add.to_s + " last items added to current page var list"
        
        # Contract.where({"book_id" => 1})
        puts @record_page_set + "hello"

  end

  def create
  end
end

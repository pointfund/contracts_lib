class PdfPageController < ApplicationController
    
    include PdfPageHelper
    include PdfFontsHelper
    include ChooserPagesPdf
    require 'active_support'
    require 'active_support/core_ext'

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
            # @record = Record.find(params[:id])
            @record = Record.find(1)    
        end

        @records = Record.all
        total_records =  @records.length
        @last_record = total_records - 1
        record = @record
        # @image_tag = Array.new
        # @images = Dir.glob("app/assets/images/pf_base_btn_set/*.jpg")
        # @form_pages = "<div class='page_samp'>#{@images[0]}</div>"
        # @img_lib = @images.length


        @contractA = Contract.where({book_id: 1})
        # @contracts_bk_02 = Contract.where({book_id:  2})
        # @contracts_bk_03 = Contract.where({book_id: 3})





        show
    end

    def show
        new_book = Chooser.new
        @contracts = Contract.all
        # @books = Book.where({id: 2})
        @books = Book.all
        # @books = Book.find(1)  
        # pageQue = Chooser.new 
        # if(params[:create_pages])
        #     @record_page_set = params[:create_pages]
        # else 
        #     @record_page_set = ""    
        # end
        # @record_page_set = ""
        holdpage_add = params["page"].to_i
        # @record_page_set = new_book.addSinglePage(params["page"].to_i, @record_page_set)
            if(@record_page_set == nil)
            puts "      Record : " + @record_page_set.to_s + "before set "
            # get all params set
            @record_page_set = getParams(params, new_book, @record_page_set)
            # puts @page + " new"
            # @record_page_set = new_book.addSinglePage(@page, @record_page_set)
            puts "      Record : " + @record_page_set.to_s + "after book set"
        end
        count = 0
        # size of pdf lib 
        @book_page_set = @books.length
        # last selection 
        # puts holdpage_add.to_s + " last items added to current page var list"
        # Contract.where({"book_id" => 1})
        puts "      Record : " + @record_page_set.to_s + " : show complete list"
        # @contractA = Contract.where({book_id: "1"})
        # @contracts_bk_02 = Contract.where({book_id:  2})
        # @contracts_bk_03 = Contract.where({book_id: 3})
    end

    def create

        PagePart.order('part_area ASC').reorder('id ASC')
        PageLayout.order('part_area ASC').reorder('id ASC')

        get_cont = []
        @contracts = Contract.all
        @records = Record.find(params[:rec_id])
        
        # @records = Record.find(params[:rec_id])
        # @records = Record.find(params[:rec_id])
        # get_pages = params[:create_pages]
        #get past records 
        # params["create_pages"]
        item_array = []
        place_array = [] 
        records_array = []
        print_page = 0 

        # def player
        #     puts "reset page"
        # end

        # def reset_contract(print_page)
        #     puts "reset Contract and add new"
        #     @parts = PagePart.where({contract_id: print_page})
        #     @parts.order('id ASC')   
        #     @layouts = PageLayout.where({contract_id: print_page})
        #     @layouts = @layouts.order('id ASC')
        #     bridge = [@layouts, @parts]
        #     # puts bridge[0][0].to_s + " : see part"
        #     return bridge
        # end




        # def is_list(job_id, item_array, place_array)
        #     if(job_id != nil)
        #         # reset_contract(print_page)
        #         reset_contract(job_id)
        #         puts "reset contract"  + job_id
        #         # parts.order('id ASC')  
        #         # layouts.order('id ASC')
        #         item_array = []
        #         place_array = [] 
        #         @parts.each do |x|
        #             puts "parts : " + x.content[0..20]
        #             item_array.push(x.content) 
        #         end
        #         @layouts.each do |z|
        #             puts "layouts : " + z.posx.to_s + " " + z.posy.to_s
        #             place_array.push([z.posx, z.posy])
        #         end
        #     end

        #     puts  " parts page long : " + @parts.length.to_s + "******************* " + place_array.to_s + " jobd ID : " + job_id 
        #     # puts  " layouts page long : " +  @layouts.length.to_s + "******************* " + item_array.to_s
        #     return  item_array, place_array
        # end


        @job_ids = []

        puts "length " + @job_ids.length.to_s 

        if(params[:create_pages] != nil)
            @job_ids = params[:create_pages].split(', ')
            # is_list(@job_ids, item_array, place_array)
            @job_ids.each do |var| 
                # var list each page
                print_page = var
                puts var + " : log each page " + params[:create_pages]
                # grab_page(print_page);
                # puts reset_contract(print_page)
                # puts page_P[0][1]
                # page_X = page_P[0]
                # page_Y = page_P[1]
            end
            puts "found " + @job_ids.length.to_s + " created pages "  

        end


        #Check job list


        # testing parts and layout output 
        if(item_array != nil)
            puts "parts full " + item_array.length.to_s + " : jobs list :" +  @job_ids.length.to_s
        else
            puts "parts empty"
        end

        if(place_array != nil)
            puts "layouts " + place_array.length.to_s
        else
            puts "parts empty"
        end

        # end

        # @records.each do |d|
        # d.each do |e|
        # puts d
        # end
        # records_array.push(d) 
        # end
        # puts @record_page_set + "hello2"
        # puts place_array.length

        # if format is pdf create pdf 
        respond_to do |format|
            format.js
            format.html
            format.pdf do 
                # pdf = Prawn::Document.new
                # AddFontsPdf.new(pdf)


                # pdf.start_new_page
                @record_page_set = params["create_pages"]
                # file from assets 
                if(@job_ids != nil)
                    i = @job_ids.length
                    @page = []
                    items = []
                    item_things = []
                    place_things = []
                    @job_ids.each do |contract| 
                        # puts "items array of " + item_array.length.to_s
                        # puts contract + " who are you ?"
                        # puts is_list(contract, item_array, place_array)
                        
                        # PagePart.order('part_area ASC').reorder('id ASC')
                        # PageLayout.order('part_area ASC').reorder('id ASC')

                        @parts = PagePart.where({contract_id: contract.to_s})
                        @layouts = PageLayout.where({contract_id: contract.to_s})
                        
                        # @part.each do |x|
                        #     page.push(x.content)
                        # end    
                        @item_array = []
                        @place_array = []

                        @parts.each do |x|
                            # puts "parts : " + x.content[0..20]
                            @item_array.push(x.content)
                        end

                        @layouts.each do |z|
                            # puts "layouts : " + z.posx.to_s + " " + z.posy.to_s + contract
                            @place_array.push([z.posx, z.posy])
                        end

                        # item_things.push(item_array) 
                        # place_things.push(place_array)

                        @page.push([contract, @item_array,  @place_array ])
                        # puts @page[0].to_s
                        # items = is_list(contract, item_array, place_array)

                        # item_things.push(items[0])
                        # place_things.push(items[1])

                        puts " hello " + @job_ids.length.to_s

                        # puts "things array " + item_array.length.to_s
                        # # reset_contract(contract)
                        # # player
                        # puts contract.to_s + " : each page loop " + i.to_s
                        # # arg 
  
                        # puts "Finish page : " + i.to_s
                        # i--
                        
                        # if(i <= @job_ids.length -1 )
                        
                        # end
                    end

                        # puts "pages : " + page[0].to_s + page[1][0].to_s + " I'm done" + + page[2][0].to_s
                        # puts "pages : " + page[0].to_s + page[1].to_s + " I'm done" + + page[2].to_s
                        # puts "pages : " + page.to_s 
                        # puts page.length.to_s + " list length"
                   

                    pdf = Prawn::Document.new
                    AddFontsPdf.new(pdf)

    
                    puts "not goin to run this time"

                    # pdf = SendLetter.generate("point_funding_doc.pdf") do |doc|
                    #     doc.text "what is going in here ??"
                    # # pdf = Prawn::Document.new
                    # end 
                    # nope = SendLetter.new(pdf, item_array, place_array, @records, @job_ids, 1)
                    #                     pdf.start_new_page
                    # nope.page_letter_2(pdf, item_array, place_array, @records, @job_ids, 1)
                    # nope.page_letter_2(pdf, @page[0][1], @page[0][2], @records, @job_ids, 2)
                    # puts @page[1][2].to_s
                    # AddFontsPdf.new(pdf)
                    # mybook = []
                    # counter = 1
                    @page.each_with_index do |spread, inx|
                        counter = inx + 1
                    #     puts counter.to_s + " ticker"
                    #     # pdf.start_new_page
                    #     # puts spread[2]
                    #     # spread.each do |a|
                    #     puts inx.to_s
                    #     nope = ""
                    #     # pdf.start_new_page 
                    #     sample = nil
                    #     puts inx.to_s + " count loop of : " + @page.length.to_s
                        if(counter.to_i == 1)
                    #         # @nope = SendLetter.new(pdf, @page[0][1], @page[0][2], @records, @job_ids, @page[0][0])
                    #         # SendLetter.new(pdf, @page[0][1], @page[0][2], @records,  @job_ids, 13)
                    #         pdf.start_new_page
                            SendLetter.new(pdf, @page[inx][1], @page[inx][2], @records,  @job_ids, 13)
                    #         # pdf.start_new_page
                    #         # sample = 
                    #         # mybook.push(SendLetter.new(pdf, spread[1], spread[2], @records, @job_ids, spread[0]))
                    #         # sample = SendLetter.generate(pdf, spread[1], spread[2], @records, @job_ids, spread[0])
                    #         puts "set sample " + inx.to_s
                    #         # send_data pdf.render, filename: 'point_funding_doc.pdf', type: 'application/pdf', disposition: "inline"        
                    #         # Explicit Block
                    #         # Prawn::Document.generate("point_funding_doc.pdf") do |pdf|
                    #         #     pdf.text "Hello World"
                        end
                    #     #     # sample = SendLetter.new(pdf, page[contract], place_things, @records, @job_ids, contract)
                        if(counter.to_i >= 2)
                    #         pdf.start_new_page
                    #         # nope.page_letter_2(pdf, item_array, place_array, @records, @job_ids, 1)
                    #         SendLetter.new(pdf, @page[inx][1], @page[inx][2], @records,  @job_ids, @page[inx][0])
                    #         # @nope.page_letter_2(pdf, @page[inx][1], @page[inx][2], @records, @job_ids, @page[inx][0])
                    #         puts "set sample " + inx.to_s
                    #         # sample.page_letter_2(pdf, spread[1], spread[2], @records, @job_ids, spread[0])
                    #     #     Prawn::Document.generate("point_funding_doc.pdf") do 
                    #     #     text "Hello World"

                        end
                    #     # end
                    #     counter = counter + 1
                    end

                    # mybook.each do |a|
                    #    puts a.to_s + "next"
                    # end
                    # pdf.start_new_page
                    # end
                    # send_data pdf.render, filename: 'point_funding_doc.pdf', type: 'application/pdf', disposition: "inline"    

                end
            send_data pdf.render, filename: 'point_funding_doc.pdf', type: 'application/pdf', disposition: "inline"
            puts "No Way ..............................................................."

            end
        end
    end







    private 
        def getParams(params, new_book, record_page_set)
            if(params != nil)
                puts "passed in some vars in url <check list page book and remove>"
                # check if each page added 
                if(params[:create_pages])
                    record_page_set = params[:create_pages]
                    puts "show record on load : " + record_page_set.to_s
                else
                    record_page_set = ""
                end
                # check if book set add entire book to que list
                if(params[:book_c])
                    books = params[:book_c]
                    add_books = new_book.getBookPages(books, record_page_set)
                    # @record_page_set = record_page_set.to_s + add_books.to_s
                    puts "Collection " + add_books + " - |  " + record_page_set
                end
                # page passed add page to Que
                if(params[:page])
                    page = params["page"].to_s + ", "
                    # record_page_set = new_book.addSinglePage(1, "")
                    record_page_set = record_page_set + page
                    puts " add page " + page + " to list : "
                    # @page = page
                else
                    # @ empty string
                    page = ""
                end
                    # @page = page
                puts "Query # : " + page + " current page"
                    # end

                # if(params[:create_pages] != "")
                #     @record_page_set = params[:create_pages]
                # else 
                #     @record_page_set = ""    
                # end
                # get record list as string
                if(params[:create_pages])
                    # if(page != nil)
                    puts "get list A************************** " + params[:create_pages].to_s
                        record_col = params[:create_pages].to_s
                        # record_page_set = record_col + page.to_s
                        # puts record_page_set + " page and records"
                    # else
                        # record_page_set = params[:create_pages].to_s
                        # puts record_page_set + " only records"
                    # end
                   
                    # @record_page_set = record_page_set 
                    # puts record_page_set + " nil page"
                else
                end
               

                record_page_set = record_col.to_s + add_books.to_s + page
                record_page_set = split(record_page_set)   
                #remove from que
                if(params[:remove])
                    if(record_page_set)
                    puts "Nothing : " + record_page_set.to_s
                    record_page_set = splitRemove(record_page_set)
                    puts "      Record : "+ params[:remove].to_s + " send removeable to list :after remove" + @record_page_set.to_s
                    end
                end
            
                # uniwue check 
                # record_page_set = record_page_set.to_s
                # if(record_page_set != nil && params[:remove])
                #     puts "      Record : in remove" + record_page_set.to_s
                #     record_page_set = split(record_page_set)
                #     # record_page_set = splitRemove(record_page_set)
                # end
                # puts "      Record : " + record_page_set.to_s + " : to remove "
                # set record list to instance var 
                @record_page_set = record_page_set   
                # @record_page_set = record_page_set.to_s + add_books.to_s + page   
                # @record_page_set = record_page_set + page  
                # puts @record_page_set + " add all"  
                # @record_page_set = record_page_set
                # @record_page_set = new_book.addSinglePage(page, record_page_set)
                # @record_page_set = new_book.addSinglePage(page, record_page_set)
                return record_page_set
            end
            # puts @record_page_set
            # return @record_page_set
        end



        # check array of string 
        def split(record_page_set)
            job_ids = ""
            if(record_page_set != nil)
                if(record_page_set == "")
                    puts "only space ..............................................."
                end
            puts record_page_set.to_s + "page list as string"
                job_ids = record_page_set.split(', ')
            puts job_ids.to_s + " after split apart"
                job_ids = job_ids.uniq
            puts job_ids.to_s + " after uniq check"
                job_ids = job_ids.join(', ')
                if(job_ids == ", " || job_ids[job_ids.length - 1] == ",")
                    job_ids =  ""
                else
                    job_ids = job_ids + ", "
                end
                # puts @job_ids.join(', ')
            puts job_ids.to_s + " after join check for "

                if(job_ids[0] == ",")
                    job_ids = ""
                end
                return job_ids
            end
        end


        def splitRemove(record_page_set)
            puts "list : " + record_page_set.to_s
            if(params["remove"])
                remove = params[:remove]
                puts "Choosen to remove page " + remove + " from" + record_page_set.to_s + " list"
                rem_job_ids = ""
                if(record_page_set)
                    rem_job_ids = record_page_set.split(', ')
                    puts rem_job_ids.to_s + " remove from array "
                    if(rem_job_ids.find_index(remove))


                        puts rem_job_ids.to_s + " found it for removal : " + remove.to_s
                        index_A = rem_job_ids.find_index(remove)
                        puts  " index : " + index_A.to_s
                        if(index_A)
                            rem_job_ids.delete_at(index_A)
                            # rem_job_ids = rem_job_ids
                            puts remove + " after remove " + rem_job_ids.to_s + " -- " +  rem_job_ids[0].to_s
                            rem_job_ids = rem_job_ids.join(', ')
                            rem_job_ids = rem_job_ids + ", "
                            record_page_set = rem_job_ids
                       
                            return  record_page_set
                        else
                            record_page_set 
                            return record_page_set
                        end
                    else
                        record_page_set  
                        return record_page_set
                      
                    end
                end
            end
        end
end


# end
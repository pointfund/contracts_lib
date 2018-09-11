class BookbuilderController < ApplicationController
    require 'csv'  
    def show
        # imp_page_b = "app/assets/builddb/books.csv"
        @books = Book.all
        @contracts = Contract.all
        @page_parts = PagePart.all
        @layouts = PageLayout.all 
    end

    def play
    end


    def build_books
        @books = Book.all
        @contracts = Contract.all
        @page_parts = PagePart.all
        @layouts = PageLayout.all
        imp_page_b = "app/assets/builddb/books.csv"
    if(@books.length <= 0)
        CSV.foreach(imp_page_b, :headers => true) do |row|
            puts row
            Book.create!(row.to_hash)
        end
    end
        # @books = Book.all
        # @contracts = Contract.all  
    end

    def build_contracts
        @books = Book.all
        @contracts = Contract.all
        @page_parts = PagePart.all
        @layouts = PageLayout.all
        imp_page_c = "app/assets/builddb/contracts.csv"
    if(@contracts.length <= 0)
        CSV.foreach(imp_page_c, :headers => true) do |row|
            puts row
            Contract.create!(row.to_hash)
        end
    end
    #     # @books = Book.all
    #     @contracts = Contract.all  
    #     @page_parts = PagePart.all
    end


    def build_parts
        @books = Book.all
        @contracts = Contract.all
        @page_parts = PagePart.all
        @layouts = PageLayout.all
        # PagePart.all
        imp_page_b = "app/assets/builddb/page_parts_main.csv"
        imp_page_p = "app/assets/builddb/page_parts_3.csv"

    if(@page_parts.length <= 0)
        CSV.foreach(imp_page_b, :headers => true) do |row|
           puts row
           PagePart.create!(row.to_hash)
        end
        CSV.foreach(imp_page_p, :headers => true) do |row|
           puts row
           PagePart.create!(row.to_hash)
        end
    end
        # @page_parts = PagePart.all
        # @layouts = PageLayout.all


    end

    def build_layouts
        @books = Book.all
        @contracts = Contract.all
        @page_parts = PagePart.all
        @layouts = PageLayout.all

        imp_page_d = "app/assets/builddb/page_layouts_main.csv"
        imp_page_lay = "app/assets/builddb/page_layouts_3.csv"
        if(@layouts.length <= 0)
            CSV.foreach(imp_page_d, :headers => true) do |row|
                puts row
                PageLayout.create!(row.to_hash)
            end
            CSV.foreach(imp_page_lay, :headers => true) do |row|
                puts row
                PageLayout.create!(row.to_hash)
            end
        end
    #     @layouts = PageLayout.all
    #     @page_parts = PagePart.all
        build_page_09
    end


    def build_page_09
        @books = Book.all
        @contracts = Contract.all
        @page_parts = PagePart.all
        @layouts = PageLayout.all

        imp_page_09 = "app/assets/builddb/page_parts_09.csv"
        imp_lay_09 = "app/assets/builddb/page_layout_09.csv"
        if(@layouts.length <= 193)
            CSV.foreach(imp_page_09, :headers => true) do |row|
                # puts row
                PagePart.create!(row.to_hash)
            end
            CSV.foreach(imp_lay_09, :headers => true) do |row|
                # puts row
                PageLayout.create!(row.to_hash)
            end
        end
    #     @layouts = PageLayout.all
    #     @page_parts = PagePart.all
    end     


        

 
        















end

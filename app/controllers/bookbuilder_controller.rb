class BookbuilderController < ApplicationController
require 'csv'  
    def show
        # imp_page_b = "app/assets/builddb/books.csv"
        @books = Book.all
        @contracts = Contract.all 
    end

    def play
    end


    # def build_books
    #     imp_page_b = "app/assets/builddb/books.csv"
    #     CSV.foreach(imp_page_b, :headers => true) do |row|
    #         # puts row
    #         Book.create!(row.to_hash)
    #     end
    #     @books = Book.all
    #     @contracts = Contract.all  
    # end

    def build_contracts
    #     imp_page_c = "app/assets/builddb/contracts.csv"

    #     CSV.foreach(imp_page_c, :headers => true) do |row|
    #         # puts row
    #         Contract.create!(row.to_hash)
    #     end
    #     # @books = Book.all
        @contracts = Contract.all  
        @page_parts = PagePart.all
    end


    def build_parts
        PagePart.all
    #   imp_page_p = "app/assets/builddb/page_parts.csv"
        imp_page_p = "app/assets/builddb/page_part_update.csv"
        CSV.foreach(imp_page_p, :headers => true) do |row|
    #       # puts row
            # PagePart.create!(row.to_hash)
        end
        @page_parts = PagePart.all
        @layouts = PageLayout.all
    end

    def build_layouts
    #   imp_page_l = "app/assets/builddb/page_layouts.csv"
    #   imp_page_l = "app/assets/builddb/page_layouts.csv"
        imp_page_l = "app/assets/builddb/layouts_update.csv"
        CSV.foreach(imp_page_l, :headers => true) do |row|
    #         # puts row
            # PageLayout.create!(row.to_hash)
        end
        @layouts = PageLayout.all
        @page_parts = PagePart.all
    end

    # def build_pg_01
    #     #     imp_page_l = "app/assets/builddb/cont_pg_1.csv"
    #         imp_page_1 = "app/assets/builddb/page_part.csv"
    #     #     imp_page_l = "app/assets/builddb/sect_pg_A.csv"
    #     CSV.foreach(imp_page_1, :headers => true) do |row|
    #         puts row
    #         PagePart.create!(row.to_hash)
    #         # puts  row.to_s
    #     end
    #     @layouts = PagePart.all
    #     @page_parts = PagePart.all
    # end


    # def build_contracts
    #     imp_page_c = "app/assets/builddb/contracts.csv"
    #     CSV.foreach(imp_page_c, :headers => true) do |row|
    #         # puts row
    #         Contract.create!(row.to_hash)
    #     end
    #     # @books = Book.all
    #     @contracts = Contract.all  
    #     @page_parts = PagePart.all
    # end


    # def  build_pg_lay01
    #     # imp_page_l = "app/assets/builddb/cont_pg_lay_1.csv"
    #     imp_page_l = "app/assets/builddb/layout_A.csv"
    #     CSV.foreach(imp_page_l, :headers => true) do |row|
    #         # puts row
    #         PageLayout.create!(row.to_hash)
    #     end
    #     @layouts = PageLayout.all
    #     @page_parts = PagePart.all
    # end



       
     


        

 
        















end

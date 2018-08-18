class BookbuilderController < ApplicationController
require 'csv'  
    def show
        # imp_page_b = "app/assets/builddb/books.csv"
        @books = Book.all
    end

    def play
    end


    def build_books
        imp_page_b = "app/assets/builddb/books.csv"
        CSV.foreach(imp_page_b, :headers => true) do |row|
            # puts row
            # Book.create!(row.to_hash)
        end
        
    end

    def build_contracts
        imp_page_c = "app/assets/builddb/contracts.csv"
        CSV.foreach(imp_page_c, :headers => true) do |row|
            # puts row
            # Contract.create!(row.to_hash)
        end
        # @books = Book.all

    end











    def build_parts
        imp_page_p = "app/assets/builddb/page_parts.csv"
        CSV.foreach(imp_page_p, :headers => true) do |row|
            # puts row
            # PagePart.create!(row.to_hash)
        end

        # @contracts = Contract.all
    end

    def build_layouts
        imp_page_l = "app/assets/builddb/page_layouts.csv"
        CSV.foreach(imp_page_l, :headers => true) do |row|
            # puts row
            # PageLayout.create!(row.to_hash)
        end
        
        # @page_parts = PagePart.all
    end




       
     


        

 
        















end

class BookbuilderController < ApplicationController
require 'csv'  
    def show
        imp_page_b = "app/assets/builddb/books.csv"

        CSV.foreach(imp_page_b, :headers => true) do |row|
        # puts row
        # Book.create!(row.to_hash)
        end
    end

    def play
    end

    def build_parts
    end

    def build_layouts
    end

    def build_books
    end

    def build_contracts
    end
end

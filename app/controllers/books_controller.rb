class BooksController < ApplicationController
  require 'active_support'
require 'active_support/core_ext'
before_action :set_book, only: [:show, :edit, :update, :destroy]
  # include DisplayBookContracts
  # include PdfFontsHelper add helper to file method
helpers.this_method

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
    @layouts = PageLayout.all
    @contracts = Contract.all
    if(params[:id] != nil)
      @contracts = Contract.where({ book_id: params[:id] })
    else
      @contracts = Contract.all
    end
      @home = @contracts
      @page_parts = PagePart.all
  end

  # GET /books/1
  # GET /books/1.json
  def show
    this_method
    ShowBookContracts.new
    @book_all = Book.all
    @books = Book.where({id: params[:id]})
    # @articles = Article.where({book_id: params[:id]})
    # @contracts = Contract.all
    @contracts = Contract.where({ book_id: @book.id })
    @home = @contracts

    # @page_parts = PagePart.where({contract_id: 1})
    @page_parts = PagePart.all
    # @book_parts = @page_part
    # @page_parts = PagePart.where(contract_id: params[:id])
    # @layouts = Layout.where({page_part_id: 1})
    # @contracts = Contract.all
    @layouts = PageLayout.all



  end
  # GET /books/1/edit
  def edit
  end
  # GET /books/new
  def new
    @book = Book.new
  end



  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:name, :page_count)
    end
end

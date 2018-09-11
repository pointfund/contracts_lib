class ContractsController < ApplicationController
before_action :set_contract, only: [:show, :edit, :update, :destroy]
# before_action :get_contacts
# GET /contracts
# GET /contracts.json
def index
    # @contracts = Contract.all
    @contracts = Contract.all
    @layouts = PageLayout.all

    # @contractB = Contract.where("book_id" => "2");



end

# GET /contracts/1
# GET /contracts/1.json
def show
    # @books = Book.where({id: params[:id]})
    @books = Book.all
    @book = Book.where({id: @contract.book_id })
    @contracts = Contract.where({ book_id: @contract.book_id })
    @this_book = Book.find(@contract.book_id)
    # @contracts = Contract.where({book_id: params[:id]})
    
    @book_id =  @contract.book_id
    # @contracts = Contract.where({ book_id: 1 })
    @home = @contracts
    # @books = Book.where({id: @contract.book_id})
    @all_layouts = PageLayout.all.length
    @page_parts = PagePart.where(contract_id: params[:id])
    @page_parts.length
    @layouts = PageLayout.where({contract_id: params[:id]}).order('page_area DESC').reorder('id ASC')
    # @hold = []
    # a = 0
    # @page_parts.each do |z|
    #   @hold.push([z.name, z.id])
    #   puts @hold[a]
    #   a = a + 1
    # end
    # @layouts = PageLayout.all
    if(@all_layouts.to_i <  params[:id].to_i )
        @needed = 1
        @set_tbl_col = 2 + @needed
    else
        @needed = 0
        @set_tbl_col = 2
    end








end

# GET /contracts/new
def new
    @contract = Contract.new
    # @contract = Contract.new(contract_params)
    if(params["book_id"])
    puts "found it "
    end
    puts "show controller "
end

# GET /contracts/1/edit
def edit
end


def show_edit
    @books = Book.all
    get_record = 1
    # @book = Book.where({id: @contract.book_id })
    
    # @contracts = Contract.where({book_id: params[:id]})
    # @contracts = Contract.where({ book_id: @contract.book_id })
    # params[:contract_id] Contract.where()




    if(params[:contract_id] != nil)
        get_contract = params[:contract_id]
        @contracts = Contract.find(get_contract)

        get_book = @contracts.book_id 
        @contracts = Contract.where({ book_id: get_book })
        @page_parts = PagePart.where(contract_id: get_contract).first(210)
        @page_layouts = PageLayout.where({contract_id: get_contract}).first(210)

    else
        @contracts = Contract.where({ book_id: 1 })
        @page_parts = PagePart.where(contract_id: get_record)
        @page_layouts = PageLayout.where({contract_id: get_record})
            
    end
    @book = Book.where({id: get_record })


    # @contracts = Contract.where({ book_id: 1 })
    # @book_id =  @contract.book_id
    # @contracts = Contract.where({ book_id: 1 })
    @home = @contracts
    # @books = Book.where({id: @contract.book_id})

    # @page_parts = PagePart.where(contract_id: params[:id])
    @page_len = @page_parts.length
    # @layouts = PageLayout.where({contract_id: params[:id]})
    @page_part = PagePart.new
    # @page_layouts = Pagelayout.where(contract_id: get_record)
    @page_layout = PageLayout.new
    page_layout = @page_layout
    @var_list = RecordList.new
    var_list = @var_list

end

# POST /contracts
# POST /contracts.json
def create
    puts "creeate controller "
    @contract = Contract.new(contract_params)

    respond_to do |format|
        if @contract.save
        format.html { redirect_to @contract, notice: 'Contract was successfully created.' }
        format.json { render :show, status: :created, location: @contract }
        else
        format.html { render :new }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
        end
    end
end

# PATCH/PUT /contracts/1
# PATCH/PUT /contracts/1.json
def update
        respond_to do |format|
        if @contract.update(contract_params)
        format.html { redirect_to @contract, notice: 'Contract was successfully updated.' }
        format.json { render :show, status: :ok, location: @contract }
        else
        format.html { render :edit }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
        end
    end
end

# DELETE /contracts/1
# DELETE /contracts/1.json
def destroy
    @contract.destroy
    respond_to do |format|
    format.html { redirect_to contracts_url, notice: 'Contract was successfully destroyed.' }
    format.json { head :no_content }
    end
end

private
# Use callbacks to share common setup or constraints between actions.
def set_contract
    @contract = Contract.find(params[:id])
end

# Never trust parameters from the scary internet, only allow the white list through.
def contract_params
    params.require(:contract).permit(:name, :sections, :book_id)
    end
end

class ContractsController < ApplicationController
before_action :set_contract, only: [:show, :edit, :update, :destroy]
# before_action :get_contacts
# GET /contracts
# GET /contracts.json
def index
    @contracts = Contract.all
    @layouts = PageLayout.all
end

# GET /contracts/1
# GET /contracts/1.json
def show
    # @books = Book.where({id: params[:id]})
    @books = Book.all
    @book = Book.where({id: @contract.book_id })
    # @contracts = Contract.where({book_id: params[:id]})
    @contracts = Contract.where({ book_id: @contract.book_id })
    @book_id =  @contract.book_id
    # @contracts = Contract.where({ book_id: 1 })
    @home = @contracts
    # @books = Book.where({id: @contract.book_id})

    @page_parts = PagePart.where(contract_id: params[:id])
    @page_parts.length
    @layouts = PageLayout.where({contract_id: params[:id]})
    # @hold = []
    # a = 0
    # @page_parts.each do |z|
    #   @hold.push([z.name, z.id])
    #   puts @hold[a]
    #   a = a + 1
    # end
    # @layouts = PageLayout.all
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
    get_record = 3
    # @book = Book.where({id: @contract.book_id })
    @book = Book.where({id: get_record })
    # @contracts = Contract.where({book_id: params[:id]})
    # @contracts = Contract.where({ book_id: @contract.book_id })
    @contracts = Contract.where({ book_id: 3 })
    # @book_id =  @contract.book_id
    # @contracts = Contract.where({ book_id: 1 })
    @home = @contracts
    # @books = Book.where({id: @contract.book_id})

    @page_parts = PagePart.where(contract_id: get_record)
    # @page_parts = PagePart.where(contract_id: params[:id])
    @page_len = @page_parts.length
    @page_layouts = PageLayout.where({contract_id: get_record})
    # @layouts = PageLayout.where({contract_id: params[:id]})
    @page_part = PagePart.new
    # @page_layouts = Pagelayout.where(contract_id: get_record)
    @page_layout = PageLayout.new
    page_layout = @page_layout
    @var_list = VariableList.new
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

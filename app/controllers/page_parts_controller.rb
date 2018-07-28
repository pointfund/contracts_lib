class PagePartsController < ApplicationController
   before_action :set_page_part,  only: [:show, :edit, :update, :destroy]
 include FindContracts
  # GET /page_parts
  # GET /page_parts.json
  def index
    @layouts = PageLayout.all


    if(params[:contract_id])
    @contract = Contract.find(params[:contract_id])
else
  @contract = Contract.all
end

    if(params[:contract_id] != nil)
      @page_parts = PagePart.where({contract_id: params[:contract_id]})
      @layouts = PageLayout.where({contract_id: params[:contract_id]})
    else 
      @page_parts = PagePart.all
      @layouts = PageLayout.all  
    end
    @contracts = get_contracts
    @home = @contracts
    # puts contracts.length
    # @book = contract.book_id
    # @book = Book.where({id: })
  end

  # GET /page_parts/1
  # GET /page_parts/1.json
  def show
    get_section = PagePart.where({ id: params[:id]})
    # if()
    get_sel_num = get_section[0].contract_id
    @layouts = PageLayout.where({contract_id: params[:contract_id]})
    # if(params[:contract_id])
    #   puts " use contrac_id"
    #   @contract = @contract[0]
    # else
    @page_parts = PagePart.where({contract_id: params[:contract_id] } )
    # @contract = Contract.find(params[:contract_id])
    # @home = @contract
    # end 
    # @layouts = PageLayout.where({contract_id: params[:contract_id]})
    # @layouts = PageLayout.where({contract_id: params[:contract_id]})
    # @page_parts = PagePart.where({contract_id: params[:id]})

    # @contracts = Contract.all
    # @contract = @contracts[0]
      
    # @home = @contracts
    puts @page_parts.length
    # @contract = @page_parts[0].contract_id
    # contract = get_contracts

  end

  # GET /page_parts/new
  def new
    @contract = Contract.find(params[:contract_id])
    @page_part = PagePart.new
    # @page_layout = PageLayout.new

    if(params[:contract_id])
      puts " use contract_id"
    end
    # contract = Contract.find( @page_part.contract_id )  




  end

  def show_edit
    new
    puts "show_edit loaded"
  end

  # GET /page_parts/1/edit
  def edit
    # @layouts = PageLayout.where({contract_id: params[:id]})
    # @page_parts = page_parts.where({contract_id: params[:id]})
    @get_id = ""
    if(params != nil)
      if( params[:id] != nil )
        @get_id = params[:id]
      elsif (params[:contract_id])
        @get_id =  params[:contract_id]
      else
        @get_id = ""
      end 
      @contract = Contract.find( @page_part.contract_id )  
    end
  end

  # POST /page_parts
  # POST /page_parts.json
  def create
    @page_part = PagePart.new(page_part_params)
    @page_layout = PageLayout.all
    # @page_layout = PageLayout.new(page_part_params)

    respond_to do |format|
      if @page_part.save 
        # format.html { redirect_to @page_part, notice: 'Page part was successfully created.' }
        # format.html { redirect_to :controller => :page_layouts, :action => 'new', 
        #   notice: 'Page part was successfully created.', 
        #   contract_id: @page_part.contract_id, page_part: @page_part.id   }
        format.html { redirect_to :controller => :contracts, :action => 'show_edit', 
          notice: 'Page part was successfully created.', 
          contract_id: @page_part.contract_id, page_part: @page_part.id   }
        format.json { render :show, status: :created, location: @page_part }
      else
        format.html { render :new }
        format.json { render json: @page_part.errors, status: :unprocessable_entity }
      end
    end

     # respond_to do |format|
      # if @page_layout.save
        # format.html { redirect_to @page_layout, notice: 'Page layout was successfully created.' }
        # format.json { render :show, status: :created, location: @page_layout }
      # else
        # format.html { render :new }
        # format.json { render json: @page_layout.errors, status: :unprocessable_entity }
      # end
    # end


  end
  

  def reset

    # @page_part = PagePart.find(1)
    @this_contract = 2
    @page_part = PagePart.where({contract_id: @this_contract})
  end
  # PATCH/PUT /page_parts/1
  # PATCH/PUT /page_parts/1.json
  def update



    #  respond_to do |format|
    #   if @page_layout.update(page_layout_params)
    #     format.html { redirect_to @page_layout, notice: 'Page layout was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @page_layout }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @page_layout.errors, status: :unprocessable_entity }
    #   end
    # end

    respond_to do |format|
      if @page_part.update(page_part_params)
        format.html { redirect_to @page_part, notice: 'Page part was successfully updated.' }
        format.json { render :show, status: :ok, location: @page_part }
      else
        format.html { render :edit }
        format.json { render json: @page_part.errors, status: :unprocessable_entity }
      end
    end


  end

  # DELETE /page_parts/1
  # DELETE /page_parts/1.json
  def destroy
    @page_part.destroy
    respond_to do |format|
      format.html { redirect_to page_parts_url, notice: 'Page part was successfully destroyed.' }
      format.json { head :no_content }
    end   
    # @layout.destroy
    # respond_to do |format|
    #   format.html { redirect_to layouts_url, notice: 'Layout was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
   
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page_part
      @page_part = PagePart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_part_params
      params.require(:page_part).permit(:name, :content, :contract_id, :book_id)
    end


    # Use callbacks to share common setup or constraints between actions.
    # def set_layout
    #   @layout = Layout.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def layout_params
    #   params.require(:layout).permit(:name, :posx, :posy, :page_part_id)
    # end
end

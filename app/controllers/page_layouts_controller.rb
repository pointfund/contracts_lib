class PageLayoutsController < ApplicationController
   before_action :set_page_layout, only: [:show, :edit, :update, :destroy]

  # GET /page_layouts
  # GET /page_layouts.json
  def index
    if(params[:contract_id])
      @contract = Contract.find(params[:contract_id])
      @page_layouts = PageLayout.where({contract_id: params[:contract_id]})
    else
      @contract = Contract.all
      @page_layouts = PageLayout.all
    end 

    
    # @page_layouts = PageLayout.all
    # @page_part = PagePart.find(params[:id])
    # @page_part = PagePart.find(2)
  end

  # GET /page_layouts/1
  # GET /page_layouts/1.json
  def show
    @page_layouts = PageLayout.where({contract_id: params[:id]})
  end

  # GET /page_layouts/new
  def new
    # @layouts = PageLayout.where({contract_id: params[:contract_id]})
        @page_set = ""
        @page_layout = PageLayout.new
        page_layout = PageLayout.new

        @page_part = PagePart.find(1)
        @page_part = PagePart.where({contract_id: params[:contract_id]})
        
        if(params[:contract_id])
          @set_lay_cont = params[:contract_id]
        end
  end

  # GET /page_layouts/1/edit
  def edit
    @page_layout = PageLayout.all 
    # puts params
    @page_layout = PageLayout.find(params[:id])
    page_layout = PageLayout.find(params[:id])
    @page_layouts = PageLayout.all
    layout_id = PageLayout.find(params[:id])
    if(params[:id] != nil)
      # if(params[:])
        # get_page = Contract.find(layout_id.contract_id)
        # @page_set = nil
      # end
    else
      # @page_set = params[:contract_id]
    end
      
  end

  # POST /page_layouts
  # POST /page_layouts.json
  def create
    @page_layout = PageLayout.new(page_layout_params)

    respond_to do |format|
      if @page_layout.save
        # format.html { redirect_to @page_layout, notice: 'Page layout was successfully created.' }
        format.html { redirect_to :controller => :contracts, :action => 'show_edit', 
        notice: 'Page part was successfully created.', 
        contract_id: @page_layout.contract_id  }
        # format.html { redirect_to @layout, notice: 'Layout was successfully created.' }
        format.json { render :show, status: :created, location: @page_layout }
      else
        format.html { render :new }
        format.json { render json: @page_layout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /page_layouts/1
  # PATCH/PUT /page_layouts/1.json
  def update
    respond_to do |format|
      if @page_layout.update(page_layout_params)
        format.html { redirect_to :controller => :contracts, :action => 'show_edit', 
        notice: 'Page part was successfully created.', 
        contract_id: @page_layout.contract_id  }
        # format.html { redirect_to @page_layout, notice: 'Page layout was successfully updated.' }
        format.json { render :show, status: :ok, location: @page_layout }
      else
        format.html { render :edit }
        format.json { render json: @page_layout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /page_layouts/1
  # DELETE /page_layouts/1.json
  def destroy
    @page_layout.destroy
    respond_to do |format|
      format.html { redirect_to page_layouts_url, notice: 'Page layout was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page_layout
      @page_layout = PageLayout.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_layout_params
      params.require(:page_layout).permit(:name, :posx, :posy, :page_part, :contract_id)
    end
end

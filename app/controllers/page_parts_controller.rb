class PagePartsController < ApplicationController
  before_action :set_page_part, only: [:show, :edit, :update, :destroy]
hello = "hello me"
  # GET /page_parts
  # GET /page_parts.json
  def index
    @page_parts = PagePart.all
  end

  # GET /page_parts/1
  # GET /page_parts/1.json
  def show
  end

  # GET /page_parts/new
    def new
        @page_part = PagePart.new
        @page_area = PageArea.all
        # puts hello

        if( @page_area.length >= 1 )

        end

  end

  # GET /page_parts/1/edit
  def edit
  end

  # POST /page_parts
  # POST /page_parts.json
  def create
    @page_part = PagePart.new(page_part_params)

    respond_to do |format|
      if @page_part.save
        format.html { redirect_to @page_part, notice: 'Page part was successfully created.' }
        format.json { render :show, status: :created, location: @page_part }
      else
        format.html { render :new }
        format.json { render json: @page_part.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /page_parts/1
  # PATCH/PUT /page_parts/1.json
  def update
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
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page_part
      @page_part = PagePart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_part_params
      params.require(:page_part).permit(:name, :contract_id, :content)
    end
end

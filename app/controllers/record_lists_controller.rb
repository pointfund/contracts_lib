class RecordListsController < ApplicationController
  before_action :set_record_list, only: [:show, :edit, :update, :destroy]

  # GET /record_lists
  # GET /record_lists.json
  def index
    @record_lists = RecordList.all
  end

  # GET /record_lists/1
  # GET /record_lists/1.json
  def show
  end

  # GET /record_lists/new
  def new
    @record_list = RecordList.new
  end

  # GET /record_lists/1/edit
  def edit
  end

  # POST /record_lists
  # POST /record_lists.json
  def create
    @record_list = RecordList.new(record_list_params)

    respond_to do |format|
      if @record_list.save
        format.html { redirect_to @record_list, notice: 'Record list was successfully created.' }
        format.json { render :show, status: :created, location: @record_list }
      else
        format.html { render :new }
        format.json { render json: @record_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /record_lists/1
  # PATCH/PUT /record_lists/1.json
  def update
    respond_to do |format|
      if @record_list.update(record_list_params)
        format.html { redirect_to @record_list, notice: 'Record list was successfully updated.' }
        format.json { render :show, status: :ok, location: @record_list }
      else
        format.html { render :edit }
        format.json { render json: @record_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /record_lists/1
  # DELETE /record_lists/1.json
  def destroy
    @record_list.destroy
    respond_to do |format|
      format.html { redirect_to record_lists_url, notice: 'Record list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_record_list
      @record_list = RecordList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def record_list_params
      params.require(:record_list).permit(:contract_id, :var_list)
    end
end

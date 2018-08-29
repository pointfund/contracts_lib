class RecordsController < ApplicationController
  before_action :set_record, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js

  # GET /records
  # GET /records.json
  def index
    @records = Record.all
    @contracts = Contract.all



    # @total_pay = :loan_amount.to_i / :repay_term1.to_i 
    @total_pay = :loan_amount


  end


    def get_total(record)
    record.fin_fee * record.repay_term1
        record.total_amount = record.fin_fee * record.repay_term1
        return record.total_amount
    end

  # GET /records/1
  # GET /records/1.json
  def show
  end

  # GET /records/new
    def new
        @record = Record.new
   
           @daily_late_fee = 0.0 
           @total_pay = 0.0
           @total_fin_fee = 0.0
    end

  # GET /records/1/edit
  def edit
        @record = Record.find(params[:id])
        # record.fin_fee * record.repay_term1
        # record.total_amount = record.fin_fee * record.repay_term1
        # @new =  record.loan_amount




        if(@record.loan_amount != nil && @record.repay_penalty != nil && @record.repay_term1 != nil )
            @total_pay = @record.loan_amount.to_f / @record.repay_term1.to_i + @record.repay_penalty.to_f 
            @total_pay.round(2)
            # @total_pay = @record.repay_term1
            # @total_pay = :loan_amount
            # @record.loan_amount.to_f
            @total_fin_fee = @record.repay_term1.to_i * @record.repay_penalty.to_i 
            # @total_fin_fee.round(2)
            @daily_late_fee =  @record.repay_penalty.to_f / 30
            @daily_late_fee.round(2)
        else 
           @daily_late_fee = 0.0 
        end

        # respond_to do |format|

        # end

        # @total_pay = @record.loan_amount.to_f / @record.repay_term1.to_f + @record.repay_penalty.to_f 
        # @total_pay.round(2)

        # # @total_pay = @record.repay_term1
        # # @total_pay = :loan_amount

        # @record.loan_amount.to_f
        # @total_fin_fee = @record.repay_term1.to_f * @record.repay_penalty.to_f 

        # # @total_fin_fee.round(2)
        # @daily_late_fee = @record.repay_penalty.to_f / 30
        # @daily_late_fee.round(2)


        # puts @total_fin_fee.round(2)

        # respond_to do |format|
        #     format.html
        #     format.json
        # end
  end

  # POST /records
  # POST /records.json
  def create
    @record = Record.new(record_params)
        if(@record.loan_amount != nil && @record.repay_penalty != nil)
            @total_pay = @record.loan_amount.to_f / @record.repay_term1.to_i + @record.repay_penalty.to_f 
            @total_pay.round(2)

            
            # @total_pay = @record.repay_term1
            # @total_pay = :loan_amount
            @record.loan_amount.to_f
            @total_fin_fee = @record.repay_term1.to_f * @record.repay_penalty.to_f 
            # @total_fin_fee.round(2)
            @daily_late_fee =  @record.repay_penalty.to_f / 30
            @daily_late_fee.round(2)
        else 
           @daily_late_fee = 0.0 
           @total_pay = 0.0
           @total_fin_fee = 0.0
        end





    respond_to do |format|
      if @record.save
        format.html { redirect_to edit_record_path(@record), notice: 'Record was successfully created.' }
        format.json { render :show, status: :created, location: @record }
      else
        format.html { render :new }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /records/1
  # PATCH/PUT /records/1.json
  def update
    respond_to do |format|
      if @record.update(record_params)
        format.html { redirect_to edit_record_path(@record), notice: 'Record was successfully updated.' }
        
        # format.html { redirect_to @record, notice: 'Record was successfully updated.' }
        format.json { render :show, status: :ok, location: @record }
      else
        format.html { render :edit }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /records/1
  # DELETE /records/1.json
  def destroy
    @record.destroy
    respond_to do |format|
      format.html { redirect_to records_url, notice: 'Record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_record
      @record = Record.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def record_params
      params.require(:record).permit( :loan_name, 
                                      :current_date, 
                                      :client_first_name, 
                                      :client_last_name,
                                      :client_nick,
                                      :address_street,
                                      :address_city,
                                      :address_state,
                                      :address_zip,

                                      :note_date,
                                      :loan_amount,
                                      :fin_fee,
                                      :repay_term1,
                                      :repay_term2,
                                      :repay_start,
                                      :repay_1st,
                                      :repay_mature,


                                      :total_amount,
                                      :payment_mth_day,
                                      :loan_act_fee,
                                      :stated_rate,
                                      :repay_penalty,
                                      :daily_late_fee,
                                      :total_default,
                                      :final_date,

                                      :guarantee01,
                                      :guarantee02,
                                      :guarantee03,
                                      
                                      :commencement_m,
                                      :commencement_y,
                                      :total_ded,
                                      :r3001_date,
                                      :agent_num,
                                      :agent_email,
                                      :agent_phone,
                                      :term_assignment_mths,
                                      :position
                                     )
    end
end

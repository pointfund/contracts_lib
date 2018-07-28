class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
		t.string :loan_name
		t.date :current_date
		t.string :client_first_name
		t.string :client_last_name

		t.string :client_nick

		t.string :address_street
		t.string :address_city
		t.string :address_state
		t.string :address_zip

		t.date :note_date
		t.integer :loan_amount
		t.integer :fin_fee

		t.string :repay_term1
		t.string :repay_term2

		t.date :repay_start
		t.date :repay_1st
		t.date :repay_mature

		t.integer :total_amount
		t.string :payment_mth_day
		t.integer :loan_act_fee

		t.integer :stated_rate
		t.integer :repay_penalty
		t.integer :daily_late_fee
		t.integer :total_default

		t.date :final_date
		t.string :guarantee01
		t.string :guarantee02
		t.string :guarantee03

		t.string :commencement_m
		t.string :commencement_y


		t.string :total_ded
		t.date :r3001_date
		   
		t.string :commencement_m
		t.string :commencement_y

		t.string :agent_num
		t.string :agent_email
		t.string :agent_phone
		t.integer :term_assignment_mths
		t.string :position


      t.timestamps
    end
  end
end

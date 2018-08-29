	total_addr = comp_address + " \n" + comp_address_state
			rec_set.push(total_addr)															#	5
				note_date = records_array.note_date.to_s
			rec_set.push(note_date)																#	6
				loan_amount = records_array.loan_amount.to_s
			rec_set.push(loan_amount)															#	7
				finance_fee = records_array.fin_fee.to_s
			rec_set.push(finance_fee)															#	8
				term_num = records_array.repay_term1.to_s
			rec_set.push(term_num)																#	9
				tern_th = records_array.repay_term2.to_s
			rec_set.push(tern_th)																#	10
				start = records_array.repay_start.to_s
			rec_set.push(start)																	#	11
				firsts_pay = records_array.repay_1st.to_s
			rec_set.push(firsts_pay)															#	12
				last_pay = records_array.repay_mature.to_s
			rec_set.push(last_pay)																#	13
				total_monthly = records_array.total_amount.to_s
			rec_set.push(total_monthly)															#	14
				pay_on = records_array.payment_mth_day.to_s
			rec_set.push(pay_on)																#	15
				loan_act_fee = records_array.loan_act_fee.to_s
			rec_set.push(loan_act_fee)															#	16
				rate = records_array.stated_rate.to_s
			rec_set.push(rate)


																				#	17
				late_month = records_array.repay_penalty.to_s
			rec_set.push(late_month)

																		#	18
				late_day = records_array.daily_late_fee.to_s
			rec_set.push(late_day)																#	19
				final_date = records_array.final_date.to_s
			rec_set.push(final_date)															#	20
				backerA = records_array.guarantee01.to_s
			rec_set.push(backerA)																#	21
				backerB = records_array.guarantee02.to_s
			rec_set.push(backerB)																#	22
				backerC = records_array.guarantee03.to_s
			rec_set.push(backerC)																#	23
				agt_com_mth = records_array.commencement_m.to_s
			rec_set.push(agt_com_mth)															#	24
				agt_com_yr = records_array.commencement_y.to_s
			rec_set.push(agt_com_yr)															#	25
				agt_total_ded = records_array.total_ded.to_s
			rec_set.push(agt_total_ded)															#	26
				agt_r3001 = records_array.r3001_date.to_s
			rec_set.push(agt_r3001)																#	27
				agt_code = records_array.agent_num.to_s
			rec_set.push(agt_code)																#	28
				agt_email = records_array.agent_email.to_s
			rec_set.push(agt_email)																#	29
				agt_phone = records_array.agent_phone.to_s
			rec_set.push(agt_phone)																#	30
				agt_term = records_array.term_assignment_mths.to_s
			rec_set.push(agt_term)																#	31
				agt_pos = records_array.position.to_s
			rec_set.push(agt_pos)																#	32


t.string "loan_name"
    t.date "current_date"
    t.string "client_first_name"
    t.string "client_last_name"
    t.string "client_nick"
    t.string "address_street"
    t.string "address_city"
    t.string "address_state"
    t.string "address_zip"
    t.date "note_date"
    t.integer "loan_amount"
    t.integer "fin_fee"
    t.string "repay_term1"
    t.string "repay_term2"
    t.date "repay_start"
    t.date "repay_1st"
    t.date "repay_mature"
    t.integer "total_amount"
    t.string "payment_mth_day"
    t.integer "loan_act_fee"
    t.integer "stated_rate"
    t.integer "repay_penalty"
    t.integer "daily_late_fee"
    t.integer "total_default"
    t.date "final_date"
    t.string "guarantee01"
    t.string "guarantee02"
    t.string "guarantee03"
    t.string "commencement_m"
    t.string "commencement_y"
    t.string "total_ded"
    t.date "r3001_date"
    t.string "agent_num"
    t.string "agent_email"
    t.string "agent_phone"
    t.integer "term_assignment_mths"
    t.string "position"
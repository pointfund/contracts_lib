	 pdf.table(				[ ["rec_set id"		, "array ID"		, "label"		, "form term" ],
			 				["#{ rec_set[0] }" 	, "0"				, "record name"	, "loan_name", ],
			 				["#{ rec_set[1] }" , "1"				, "current date", "current_date"],
			 				["#{ rec_set[2] }" , "2", "First Name", "first_name"],
			 				["#{ rec_set[3] }" , "3", "Last Name", "last_name"],
			 				["#{ rec_set[4] }" , "4", "Nick Name", "nick_name"],
			 				["#{ rec_set[5] }" , "5", "Full Address", "full address"],
			 				["#{ rec_set[6] }" , "6", "Sign Note Date ", "sign_note_date"],

			 				["#{ rec_set[7] }" , "7", "Loan Amount", "loan_amount"],
			 				["#{ rec_set[8] }" , "8", "Total Finance Fees", "total_finance_fee"],
			 				["#{ rec_set[9] }" , "9", "Repay Term Months", "repay_term1"],

			 				["#{ rec_set[10] }" , "10", "Repay Term :th", "repay_term2"],

			 				["#{ rec_set[11] }" , "11", "Repay Start","repay_start"],
			 				["#{ rec_set[12] }" , "12", "Repay 1st payment ", "repay_1st"],
			 				["#{ rec_set[13] }" , "13", "Repay mature date ", "repay_mature"],

			 				["#{ rec_set[14] }" , "14", "Monthly Payment ", "monthly_pay"],
			 				["#{ rec_set[15] }" , "15", "Payment late after ", "pay_due_day"],
			 				["#{ rec_set[16] }" , "16", "Activation Fee ", "activate_fee"],

			 				["#{ rec_set[17] }%" , "17", "Loan Rate ", "loan_rate"],
			 				["#{ rec_set[18] }" , "18", "Monthly Late Fee ", "month_late"],
			 				["#{ rec_set[19] }" , "19", "Late payment per day", "daily_late_fee"],
			 				["#{ rec_set[20] }" , "20", "Final Date of loan", "final_date"],
			 				["#{ rec_set[21] }" , "21", "Backer 01", "backer_A"],
			 				["#{ rec_set[22] }" , "22", "Backer 02", "backer_B"],
			 				["#{ rec_set[23] }" , "23", "Backer 03", "backer_C"],

			 				["#{ rec_set[24] }" , "24", "Commencement month ", "com_month"],
			 				["#{ rec_set[25] }" , "25", "Commencement year ", "com_year"],
			 				["#{ rec_set[26] }" , "26", "Total deduction ", "total_ded"],
			 				["#{ rec_set[27] }" , "27", "R300 date", "r3000_date"],
			 				["#{ rec_set[28] }" , "28", "Agent Number", "agent_code"],
			 				["#{ rec_set[29] }" , "29", "Email ", "agent_email"],
			 				["#{ rec_set[30] }" , "30", "Phone", "agent_phone"],
			 				["#{ rec_set[31] }" , "31", "Term assignment", "assign_term"],
			 				["#{ rec_set[32] }" , "32", "Position ", "agent_position"],
])




			 pdf.table(	 	[ ["rec_set id", "value", "label"],
			 				["#{ rec_set[0] }" , "0", "record name",],
			 				["#{ rec_set[1] }" , "1", "current date"],
			 				["#{ rec_set[2] }" , "2", "First Name"],
			 				["#{ rec_set[3] }" , "3", "Last Name"],
			 				["#{ rec_set[4] }" , "4", "Nick Name"],
			 				["#{ rec_set[5] }" , "5", "Full Address, "],
			 				["#{ rec_set[6] }" , "6", "Sign Note Date "],

			 				["#{ rec_set[7] }" , "7", "Loan Amount"],
			 				["#{ rec_set[8] }" , "8", "Total Finance Fees"],
			 				["#{ rec_set[9] }" , "9", "Repay Term Months"],

			 				["#{ rec_set[10] }" , "10", "Repay Term :th"],

			 				["#{ rec_set[11] }" , "11", "Repay Start"],
			 				["#{ rec_set[12] }" , "12", "Repay 1st payment "],
			 				["#{ rec_set[13] }" , "13", "Repay mature date "],

			 				["#{ rec_set[14] }" , "14", "Monthly Payment "],
			 				["#{ rec_set[15] }" , "15", "Payment late after "],
			 				["#{ rec_set[16] }" , "16", "Activation Fee "],

			 				["#{ rec_set[17] }%" , "17", "Loan Rate "],
			 				["#{ rec_set[18] }" , "18", "Monthly Late Fee "],
			 				["#{ rec_set[19] }" , "19", "Late payment"],
			 				["#{ rec_set[20] }" , "20", "Final Date of loan"],
			 				["#{ rec_set[21] }" , "21", "Backer 01"],
			 				["#{ rec_set[22] }" , "22", "Backer 02"],
			 				["#{ rec_set[23] }" , "23", "Backer 03"],

			 				["#{ rec_set[24] }" , "24", "Commencement month "],
			 				["#{ rec_set[25] }" , "25", "Commencement year "],
			 				["#{ rec_set[26] }" , "26", "Total deduction "],
			 				["#{ rec_set[27] }" , "27", "R300 date"],
			 				["#{ rec_set[28] }" , "28", "Agent Number"],
			 				["#{ rec_set[29] }" , "29", "Email "],
			 				["#{ rec_set[30] }" , "30", "Phone"],
			 				["#{ rec_set[31] }" , "31", "Term assignment"],
			 				["#{ rec_set[32] }" , "32", "Position "],
			 			])
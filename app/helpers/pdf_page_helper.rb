module PdfPageHelper
	require 'date'
	# extend 'page05_include'
	# class SendLetter < Prawn::Document 
	class SendLetter 	
		# def initialize(pdf, item_array, place_array,records_array, pick)
		def initialize(pdf, item_array, place_array, records_array, page_list, pick)
			# PagePart.order('part_area ASC').reorder('id ASC')
			# PageLayout.order('part_area ASC').reorder('id ASC')

			# puts "start class " + place_array[0][1].to_s
			# first_line = place_array[0][1].to_s
			rec_set = []	
					loan_name = records_array.loan_name.to_s										#	0
					current_date = records_array.current_date								#	1
				rec_set.push(loan_name)
				rec_set.push(current_date)

					first_name = records_array.client_first_name.to_s									
					last_name = records_array.client_last_name.to_s									
					nick_name = records_array.client_nick.to_s											

				rec_set.push(first_name)															#	2
				rec_set.push(last_name)																#	3
				rec_set.push(nick_name)																#	4

					comp_address = records_array.address_street.to_s
					city = records_array.address_city.to_s
					state = records_array.address_state.to_s
					zip = records_array.address_zip.to_s
					comp_address_state = city + ", " + state + " " + zip;

					total_addr = comp_address + " \n" + comp_address_state
				rec_set.push(total_addr)															#	5
					note_date = records_array.note_date
				rec_set.push(note_date)																#	6
					loan_amount = records_array.loan_amount.to_s
				rec_set.push(loan_amount)															#	7
					finance_fee = records_array.fin_fee.to_s
				rec_set.push(finance_fee)															#	8
					term_num = records_array.repay_term1.to_s
				rec_set.push(term_num)																#	9
					tern_th = records_array.repay_term2.to_s
				rec_set.push(tern_th)																#	10
					start = records_array.repay_start
				rec_set.push(start)																	#	11
					firsts_pay = records_array.repay_1st
				rec_set.push(firsts_pay)															#	12
					last_pay = records_array.repay_mature
				rec_set.push(last_pay)																#	13
					total_monthly = records_array.total_amount.to_s
				rec_set.push(total_monthly)															#	14
					pay_on = records_array.payment_mth_day.to_s
				rec_set.push(pay_on)																#	15
					loan_act_fee = records_array.loan_act_fee.to_s
				rec_set.push(loan_act_fee)															#	16
					rate = records_array.stated_rate.to_s
				rec_set.push(rate)																	#	17
					late_month = records_array.repay_penalty.to_s
				rec_set.push(late_month)															#	18
					late_day = records_array.daily_late_fee.to_s
				rec_set.push(late_day)																#	19
					final_date = records_array.final_date
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
					agt_r3001 = records_array.r3001_date
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
					pay_pen = records_array.pay_pen.to_s
				rec_set.push(pay_pen)																#	33
					prepay_pen = records_array.prepay_pen.to_s
				rec_set.push(prepay_pen)															#	33

				zvar = pick.to_i
				case zvar
					when 1
						# puts "print pdf page " + zvar.to_s + " : parts : " + item_array.length.to_s
						# 	puts "print pdf page " + zvar.to_s + " : parts : " + item_array.length.to_s
						# 	puts place_array[0][1].to_s + " : " 
					  	page_letter_1(pdf, item_array, place_array, records_array, rec_set)
					when 2
					  	page_letter_2(pdf, item_array, place_array, records_array, rec_set)
					when 3
						page_letter_3(pdf, item_array, place_array, records_array, rec_set)
					when 4
					  	page_letter_4(pdf, item_array, place_array, records_array, rec_set)
					when 5
					 	page_letter_5(pdf, item_array, place_array, records_array, rec_set)
					when 6
						page_letter_6(pdf, item_array, place_array, records_array, rec_set)
					when 7
						page_letter_7(pdf, item_array, place_array, records_array, rec_set)
					when 8
						page_letter_8(pdf, item_array, place_array, records_array, rec_set)
					when 9
						page_letter_9(pdf, item_array, place_array, records_array, rec_set)
					when 10
						page_letter_10(pdf, item_array, place_array, records_array, rec_set)
					when 11
						page_letter_11(pdf, item_array, place_array, records_array, rec_set)
					when 12
						page_letter_12(pdf, item_array, place_array, records_array, rec_set)
					when 13
						page_letter_13(pdf, item_array, place_array, records_array, rec_set)
					when 14
						page_letter_14(pdf, item_array, place_array, records_array, rec_set)	
					when 15
						page_letter_15(pdf, item_array, place_array, records_array, rec_set)	
					when 33
						page_letter_33(pdf, item_array, place_array, records_array, rec_set)
					when 34..100
					  	# puts "no pdf print page selection"  	
					  	# page_letter_2(pdf,item_array,place_array,records_array)
					else
						puts "Error: no pdf print page or record"
				end
			# end 
			end
			# = records_array.||.to_s









		# Assignment of $
		def page_letter_1(pdf,item_array,place_array,records_array,rec_set)
		 Prawn::Document.generate("point_funding_doc.pdf") do
			pdf.bounding_box([-30, 720], :width => 100, :height => 100, :at => [200, 550]) do
	            pdf.fill_color "000000"
				pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/images/logo_page.png"), :fit => [600, 1000], :at => [0, 160]
				end
	           pdf.fill_color "000000"
	        end
	        # page sign lines
	        pdf.bounding_box([0, 90],{ :width => 100, :height => 100 }) do
				pdf.rectangle [110, 190], 180, 2
				pdf.fill_rectangle [10, 100],0, 0
				# pdf.fill_color "ff0000"
				pdf.rectangle [310, 190], 180, 2
				pdf.fill_rectangle [10, 100],0, 0
				# pdf.fill_rectangle [240, 510],0, 0
	        end
	        
	        def up_one(step)
	        	step = step + 1
	        	return step	
	        end

		    def number_to_currency(num)
			  "$#{num.to_s.gsub(/\d(?=(...)+$)/, '\0,')}"
			end

			current_date = records_array.client_first_name.to_s
			my_string = item_array[0].to_s
			groupName = Time.new
			groupName = groupName.localtime.strftime('%b %d, %Y')
			say_date = my_string.gsub('#{current_date}', groupName )

			full_name = records_array.client_first_name + " " + records_array.client_last_name

			head_name = full_name
			full_name_show = head_name.gsub('#{full_name}', head_name )

			comp_address =  records_array.address_street;
			comp_address_state = records_array.address_city + ", " + records_array.address_state + " " + records_array.address_zip;

			intro = item_array[4]
			intro = intro.gsub('#{full_name}', full_name )
			intro = intro.gsub('#{nick_name}', rec_set[4].to_s )

			para_A = item_array[5].to_s 
			para_A = para_A.sub('#{full_name}', full_name )
			para_A = para_A.sub('(A1234)', rec_set[28] )
			# wash para B
			para_B = item_array[6].to_s
			# find vars and replace 
			para_B = para_B.sub('#{loan_rate}', records_array.stated_rate.to_s )
			para_B = para_B.sub('#{total_loan}', number_to_currency(records_array.total_amount) )
			st_date = records_array.repay_start.strftime("%B")
			para_B = para_B.sub('#{start_month}', st_date )	
			sign_to = item_array[9].to_s 
			sign_to = sign_to.sub('#{full_name}', full_name )
			

			tag_height = 14
			# step = up_one(step) 


			step = 0

			def get_page_loc(step, place_array, pdf, var_x, var_y)
				var_x = place_array[step][0]
				var_y = place_array[step][1]
					
				pdf.indent 320, 0 do
					pdf.stroke_color '000000'
					pdf.stroke_bounds
					pdf.text_box step.to_s + " - : " + place_array[step][0].to_s + " : w, " + place_array[step][1].to_s + " : h, ", {:size => 12, :color => "ff0000" }
					pdf.line_to [var_x, var_y]
				end
					# pdf.rectangle [var_x, var_y], 100, 200
				# end
			end
    		# page layout 
			pdf.bounding_box([ place_array[step][0], place_array[step][1]],{ :width => 430, :height => 16}) do
				pdf.font "arial", size: 10 
				pdf.text say_date +" first_line", {:color => "000000"}
				# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
	        end
			pdf.bounding_box([ place_array[step][0], place_array[step][1]],{ :width => 430, :height => 16}) do
				# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
			end
			step = up_one(step)

			# Client info 2
			pdf.bounding_box([  place_array[step][0], place_array[step][1] ], :width => 430, :height => 16) do
				pdf.text records_array.loan_name , {:color => "000000"}
					# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
			end
			step = up_one(step)  

			# info 3
			pdf.bounding_box([ place_array[step][0], place_array[step][1] ], :width => 430, :height => 16) do
			# 	pdf.text full_name_show , {:color => "000000"}
				pdf.text records_array.client_first_name , {:color => "000000"}
				# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
			end

			step = up_one(step)			
			# #Address 4
			pdf.bounding_box([ place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
				# pdf.font "arial", size: 10 
				pdf.text comp_address + " \n" + comp_address_state
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end

			step = up_one(step)
			# #intro 5
			pdf.bounding_box([ place_array[step][0], place_array[step][1]], :width => 430, :height => 16) do
				pdf.text intro
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)
			#para 01 6
			pdf.bounding_box([ place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
				# pdf.text item_array[step]
				# pdf.text item_array[5]
				pdf.text para_A 
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			# text item_array[step]
			# end
			step = up_one(step)
			#para 02 7
			pdf.bounding_box([ place_array[step][0], place_array[step][1] ], :width => 430, :height => 40) do
				
				pdf.text para_B
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			
			end
			step = up_one(step) 
			#para 03 8
			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
				pdf.text item_array[step]
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)
			# #ender 9
			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
				pdf.text item_array[step]
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)
			# #sign to 10
			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
			# 	# pdf.text item_array[step]
				pdf.text sign_to
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)
			#sign from 11
			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
				pdf.text item_array[step]
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
		 end
		end

		# Assignment of %
		def page_letter_2(pdf,item_array,place_array,records_array,rec_set)
			Prawn::Document.generate("point_funding_doc.pdf") do 
				pdf.bounding_box([-30, 720], :width => 100, :height => 100, :at => [200, 550]) do
		            pdf.fill_color "ff0000"
					pdf.transparent(1.0, 0.2) do 
						pdf.image open("app/assets/images/logo_page.png"), :fit => [600, 1000], :at => [0, 160]
					end
	            pdf.fill_color "000000"
		        end
		        # page sign lines
		        pdf.bounding_box([0, 90],{ :width => 100, :height => 100 }) do
					pdf.rectangle [110, 190], 180, 2
					pdf.fill_rectangle [10, 100],0, 0
					# pdf.fill_color "ff0000"
					pdf.rectangle [310, 190], 180, 2
					pdf.fill_rectangle [10, 100],0, 0
					# pdf.fill_rectangle [240, 510],0, 0
		        end
		        
		        def up_one(step)
		        	step = step + 1
		        	return step	
		        end

			    def number_to_currency(num)
				  "$#{num.to_s.gsub(/\d(?=(...)+$)/, '\0,')}"
				end
				# PagePart.order('part_area ASC').reorder('id ASC')
				# PageLayout.order('part_area ASC').reorder('id ASC')
				current_date = records_array.client_first_name.to_s
				my_string = item_array[0].to_s
				groupName = Time.new
				groupName = groupName.localtime.strftime('%b %d, %Y')
				say_date = my_string.gsub('#{current_date}', groupName )
				full_name = records_array.client_first_name + " " + records_array.client_last_name
				head_name = full_name
				full_name_show = head_name.gsub('#{full_name}', head_name )
				comp_address =  records_array.address_street;
				comp_address_state = records_array.address_city + ", " + records_array.address_state + " " + records_array.address_zip;

				intro = item_array[4]
				intro = intro.gsub('#{first_name}', full_name )

				para_A = item_array[5].to_s 
				para_A = para_A.sub('#{full_name}', full_name )
				para_A = para_A.sub('#{agent_code}', records_array.agent_num.to_s )
				# para_A = para_A.sub('#{agent_code}', records_array.agent_num.to_s )
				# wash para B
				para_B = item_array[6].to_s
				# find vars and replace 
				para_B = para_B.sub('#{start_month}', records_array.repay_start.to_s )
				para_B = para_B.sub('#{total_amount}', number_to_currency(records_array.total_amount) )
				para_B = para_B.sub('#{percent_of}', "--unkown--" )
				# st_date = records_array.repay_start.strftime("%B")
				# para_B = para_B.sub('#{start_month}', st_date )	
				sign_to = item_array[9].to_s 
				sign_to = sign_to.sub('#{full_name}', full_name )

				tag_height = 14
				# step = up_one(step) 
				step = 0
				puts step
				def get_page_loc(step, place_array, pdf, var_x, var_y)
					var_x = place_array[step][0]
					var_y = place_array[step][1]
						
					pdf.indent 320, 0 do
						pdf.stroke_color '000000'
						pdf.stroke_bounds
						pdf.text_box step.to_s + " - : " + place_array[step][0].to_s + " : w, " + place_array[step][1].to_s + " : h, ", {:size => 12, :color => "ff0000" }
						pdf.line_to [var_x, var_y]
					end
						# pdf.rectangle [var_x, var_y], 100, 200
					# end
				end
				
	    		# page layout 
				pdf.bounding_box([ place_array[step][0], place_array[step][1]],{ :width => 430, :height => 16}) do
					puts step
					# var_x = place_array[step][0]
					# var_y = place_array[step][1]	
					# pdf.bounding_box([ place_array[step][0], place_array[step][1] ] ), { :width => 200, :height => 300}) do
					# pdf.font "/app/assets/fonts/times-Regular.ttf"
					# pdf.text item_array[step], {:color => "00ff00"}
					pdf.font "arial", size: 10
					pdf.text say_date + " : " + "first_line", {:color => "000000"}
					# pdf.text place_array[step][0].to_s
					# pdf.text place_array[step][1].to_s

					# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
		        end
				
				# skip client info
				# step = up_one(step)  
				# pdf.bounding_box( [ place_array[step][0], place_array[step][1] ] ),{ :width => 200, :height => 30}) do
				pdf.bounding_box([ place_array[step][0], place_array[step][1]],{ :width => 430, :height => 16}) do
					puts step
					# get_page_loc(step, place_array, pdf);
					# pdf.text records_array.loan_name	
					# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
				end
				step = up_one(step)

				# Client info 2
				pdf.bounding_box([  place_array[step][0], place_array[step][1] ], :width => 430, :height => 16) do
					pdf.text records_array.loan_name , {:color => "000000"}
					# get_page_loc(step, place_array, pdf, var_x, var_y);
					# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )

				end
				step = up_one(step)  

				# info 3
				pdf.bounding_box([ place_array[step][0], place_array[step][1] ], :width => 430, :height => 16) do
				# 	pdf.text full_name_show , {:color => "000000"}
					pdf.text records_array.client_first_name , {:color => "000000"}
					# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
				end

				step = up_one(step)			
				# #Address 4
				pdf.bounding_box([ place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
		
					pdf.text comp_address + " \n" + comp_address_state
					# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
				end

				step = up_one(step)
				# # #intro 5
				pdf.bounding_box([ place_array[step][0], place_array[step][1]], :width => 430, :height => 16) do
					pdf.text intro
				# 	get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
				end
				step = up_one(step)
				# #para 01 6
				pdf.bounding_box([ place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
					pdf.text para_A
				# 	# pdf.text item_array[5]
				# 	pdf.text para_A 
				# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
				end
				# # text item_array[step]
				# # end
				step = up_one(step)
				# #para 02 7
				pdf.bounding_box([ place_array[step][0], place_array[step][1] ], :width => 430, :height => 40) do
					# pdf.text item_array[step]
					pdf.text para_B
				# 	get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
				
				end
				step = up_one(step) 
				# #para 03 8
				pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
					pdf.text item_array[step]
				# 	get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
				end
				step = up_one(step)
				# # #ender 9
				pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
					pdf.text item_array[step]
				# 	get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
				end
				step = up_one(step)
				# # #sign to 10
				pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
					# pdf.text item_array[step]
					pdf.text sign_to
				# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
				end

				# step = up_one(step)
				# # #sign from 11
				# pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
				# puts step
				# 	pdf.text item_array[step]
				# # 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
		end


		# # main Contract
		def page_letter_3(pdf, item_array, place_array, records_array, rec_set)
			pdf.bounding_box([0, 720], :width => 100, :height => 100, :at => [100, 440]) do
			    pdf.fill_color "ff0000"
			  	pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/images/point_logo.png"), :fit => [80, 80], :at => [10, 110]
					end
						# pdf.image open("app/assets/images/point_logo.png")
				        	pdf.fill_color "000000"
					        end
					        # page sign lines
					        # pdf.bounding_box([0, 0],{ :width => 200, :height => 100 }) do
								# pdf.rectangle [240, 350], 310, 2
								# pdf.fill_rectangle [10, 510],0, 0
								# pdf.fill_color "ff0000"
								# pdf.rectangle [310, 190], 180, 2
								# pdf.fill_rectangle [10, 100],0, 0
								# pdf.fill_rectangle [240, 510],0, 0
					        # end
				     
					        def up_one(step)
					        	step = step + 1
					        	return step	
					        end

						    def number_to_currency(num)
							  "$#{num.to_s.gsub(/\d(?=(...)+$)/, '\0,')}"
							end

							# PagePart.order('part_area ASC').reorder('id ASC')
							# PageLayout.order('part_area ASC').reorder('id ASC')

							current_date = records_array.client_first_name.to_s
							my_string = item_array[0].to_s
							groupName = Time.new

							groupName = groupName.localtime.strftime('  %b %d, %Y')
							say_date = my_string.gsub('#{date}', groupName )

							footer = item_array[24].to_s

							full_name = records_array.client_first_name + " " + records_array.client_last_name
							head_name = full_name

							full_name_show = head_name.gsub('#{full_name}', records_array.client_first_name )

							comp_address =  records_array.address_street;
							comp_address_state = records_array.address_city + ", " + records_array.address_state + " " + records_array.address_zip;

							address = comp_address + "\n" + comp_address_state
							# intro = item_array[9].to_s
							# intro = intro.sub('#{first_name}', head_name )
							# agent = item_array[4].to_s
							# agent = agent.gsub('#{A----}', records_array.agent_num )
							# agent = agent.gsub('#{agent_name}', full_name )

							intro = item_array[4].to_s 
							intro = intro.sub('#{first_name}', records_array.client_first_name )

							closing = item_array[9].to_s
							closing = closing.sub('#{first_name}', records_array.client_first_name )

							para_A = item_array[6].chomp.to_s 
							para_A = para_A.sub('#{start_date}', records_array.repay_start.strftime('%B, %Y').to_s )
							para_A = para_A.sub('#{current_date}', records_array.current_date.strftime('%B %d, %Y').to_s )
							para_A = para_A.sub('#{total_amount}', number_to_currency(records_array.total_amount ) )
							para_A = para_A.sub('#{final_date}', records_array.final_date.strftime('%B, %Y').to_s )

							# wash para B
							para_Book = item_array[9].to_s
							para_Book = para_Book.sub('#{first_name}', records_array.client_first_name )
							fin = number_to_currency(records_array.fin_fee)

							agent_num = rec_set[28]

							sign_from = item_array[10].to_s
							sign_from = sign_from.sub('#{agent_num}', agent_num )
							sign_from = sign_from.sub('#{full_name}', full_name )
							tag_height = 14
							# step = up_one(step) 
							step = 0

							start_date = item_array[14].to_s
							start_date = start_date.sub('#{start_date}', rec_set[1].to_date.strftime('%b %d, %Y').to_s )

							# start_date = item_array[14].to_s 
							# start_date = start_date.sub('#{start_date}', records_array.repay_start.strftime('%B, %Y').to_s )

							total_amount = number_to_currency(rec_set[7]) 
							promise = item_array[17].to_s
							promise = promise.sub('#{full_name}', full_name )
							promise = promise.sub('#{total_loan}', total_amount )

							sect_02 = item_array[19].to_s 
							sect_02 = sect_02.sub('#{repay_monthly}', number_to_currency(rec_set[18].to_s ))
							# sect_02 = sect_02.sub('#{repay_term1}', records_array.repay_term1 )
							sect_02 = sect_02.sub('#{start_date}', rec_set[6].strftime('%b %d, %Y').to_s )
							sect_02 = sect_02.sub('#{repay_penalty}', number_to_currency(rec_set[33] ) )
							sect_02 = sect_02.sub('#{repay_start}',	rec_set[12].strftime('%b %d, %Y').to_s  )
							sect_02 = sect_02.sub('#{stated_rate}', rec_set[17].to_s  )
							sect_02 = sect_02.sub('#{loan_act_fee}', rec_set[16].to_s )
							sect_02 = sect_02.sub('#{repay_term1}', rec_set[9].to_s )


							sect_03 = item_array[21]
							sect_03 = sect_03.sub('#{total_default}', number_to_currency(rec_set[14].to_s ) + ".00") 
							# sect_03 = sect_03.sub('#{repay_monthly}', number_to_currency(rec_set[14].to_s ) + ".00")
							sect_03 = sect_03.sub('#{repay_term1}', rec_set[9] )
							sect_03 = sect_03.sub('#{repay_term2}', rec_set[10] )
							# sect_03 = sect_03.sub('#{repay_start}', records_array.repay_start.strftime('%b %d, %Y').to_s )
							sect_03 = sect_03.sub('#{payment_mth_day}', rec_set[15].to_s  )
							sect_03 = sect_03.sub('#{repay_mature}', rec_set[13].to_s  )
							sect_03 = sect_03.sub('#{loan_act_fee}', number_to_currency(rec_set[16] ) )
							sect_03 = sect_03.sub('#{repay_start}',	rec_set[11].strftime('%b %d, %Y').to_s  )
							# sect_03 = sect_03.sub('#{repay_penalty}', number_to_currency(records_array.repay_penalty ) )
							sect_03 = sect_03.sub('#{loan_act_fee}',  number_to_currency(rec_set[16].to_s ))


							sect_04 = item_array[25]
							sect_04 = sect_04.sub('#{payment_mth_day}', rec_set[15]  )


							sect_05 = item_array[26]
							sect_05 = sect_05.sub('#{repay_penalty}', rec_set[33] + ".00"  )
							sect_05 = sect_05.sub('#{repay_penalty}', rec_set[33] + ".00"  )

							sect_06 = item_array[27]
							sect_06 = sect_06.sub('#{repay_penalty}', rec_set[33] + ".00"  )
							sect_06 = sect_06.sub('#{daily_late_fee}', rec_set[19]   )

							sect_07 = item_array[28]
							# sect_07 = sect_07.sub('#{repay_penalty}', rec_set[33] + ".00"  )
							sect_07 = sect_07.sub('#{daily_late_fee}', rec_set[34]   )

							sect_08 = item_array[29]
							# sect_07 = sect_07.sub('#{repay_penalty}', rec_set[33] + ".00"  )
							sect_08 = sect_08.sub('#{total_default}', "<b>" +  number_to_currency(rec_set[7]) + "</b>"  )

							sign_from_B = item_array[41]
							sign_from_B = sign_from_B.sub('#{full_name}', rec_set[2].to_s + " " + rec_set[3].to_s   )
							percent = records_array.stated_rate.to_i * 0.01 # percent rate

							fill_form = item_array[49].chomp.to_s.html_safe
							fill_form = fill_form.sub('#{full_name}', rec_set[2].to_s + " " + rec_set[3].to_s   )
							fill_form = fill_form.sub('#{address_street}', records_array.address_street.to_s   )
							fill_form = fill_form.sub('#{address_city}', records_array.address_city.to_s )
							fill_form = fill_form.sub('#{address_state}', records_array.address_state.to_s )
							fill_form = fill_form.sub('#{address_zip}', records_array.address_zip.to_s )

							set_date = item_array[56]
							set_date = set_date.sub('#{date}', rec_set[1].to_s )

							fill_name = item_array[63]
							fill_name = fill_name.sub('#{full_name}', rec_set[2].to_s + " " + rec_set[3].to_s   )

				
							guar_A = item_array[66]
							guar_A = guar_A.sub('#{full_name}', rec_set[2].to_s + " " + rec_set[3].to_s  )
							guar_A = guar_A.sub('#{start_date}', rec_set[11].strftime('%A %B %d, %Y').to_s  )

							guar_A_date = item_array[78]
							guar_A_date = guar_A_date .sub('#{current_date}', rec_set[11].strftime('%A %B %d, %Y').to_s   )
							
							sign_01 = item_array[80]
							sign_01 = sign_01.sub('#{guarantee01}', rec_set[2].to_s + " " + rec_set[3].to_s   )

					
							guar_B = item_array[82]
							guar_B = guar_B.sub('#{full_name}', rec_set[2].to_s + " " + rec_set[3].to_s  )
							guar_B = guar_B.sub('#{start_date}', rec_set[1].strftime('%A %B %d, %Y').to_s  )

							guar_B_date = item_array[95]
							guar_B_date = guar_B_date .sub('#{current_date}', rec_set[11].strftime('%A %B %d, %Y').to_s   )
							
							sign_02 = item_array[98]
							sign_02 = sign_02.sub('#{guarantee02}', rec_set[22].to_s    )


							guar_C = item_array[100]
							guar_C = guar_C.sub('#{full_name}', rec_set[2].to_s + " " + rec_set[3].to_s  )
							guar_C = guar_C.sub('#{start_date}', rec_set[1].strftime('%A %B %d, %Y').to_s  )

							guar_C_date = item_array[113]
							guar_C_date = guar_B_date .sub('#{current_date}', rec_set[11].strftime('%A %B %d, %Y').to_s   )
							
							sign_03 = item_array[116]
							sign_03 = sign_03.sub('#{guarantee03}', rec_set[23].to_s    )


							percent_of = records_array.total_amount.to_i * percent #multiply 

							def get_page_loc(step, place_array, pdf, var_x, var_y)
								# move_l = place_array[step][0].to_f
								# move_r = 750.00
								var_x = place_array[step][0]
								var_y = place_array[step][1]
							
									
								pdf.indent 320, 0 do
									pdf.stroke_color '000000'
									pdf.stroke_bounds
									pdf.text_box step.to_s + " - : " + place_array[step][0].to_s + " : w, " + place_array[step][1].to_s + " : h, ", {:size => 12, :color => "000000" }
									# pdf.text 
									# pdf.text place_array[step][1].to_s
									pdf.line_to [var_x, var_y]
								end
									# pdf.rectangle [var_x, var_y], 100, 200
									# end
							end
							step = up_one(step)
							pdf.bounding_box([30, 650],{ :width => 530, :height => 60}) do
								pdf.text say_date 
							end	
							#########################################################################################

							# page layout area  : Area 1
							pdf.bounding_box([ place_array[step][0], place_array[step][1]],{ :width => 530, :height => 100}) do
								pdf.font "times", size: 12
								# pdf.text say_date 
								# pdf.text address
								pdf.text rec_set[0] #, {:color => "00ff00"}
								pdf.text item_array[step]
								#, {:color => "00ff00"}
								# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
					        end
							step = up_one(step)
							#  # name : Area 2
							pdf.bounding_box([ place_array[step][0], place_array[step][1]],{ :width => 530, :height => 40}) do
								
							 	pdf.text full_name , {:color => "000000"}
								# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
							# # 	# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
							end
							step = up_one(step)

							# # # Full name
							pdf.bounding_box([  place_array[step][0], place_array[step][1] ], :width => 530, :height => 24) do
								# pdf.text full_name_show
								pdf.text comp_address + " \n" + comp_address_state
							# # # 	get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
							end
							step = up_one(step)  

							# # # address : Area 3
							pdf.bounding_box([ place_array[step][0], place_array[step][1] ], :width => 530, :height => 30) do
							# # 	# pdf.font "arial", size: 10 
							pdf.text intro 

							# # 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
							end
							step = up_one(step)			

							# # # reply : Area 4
							pdf.bounding_box([ place_array[step][0], place_array[step][1]], :width => 500, :height => 30) do
							# # 	# pdf.font "arial", size: 10 
							pdf.text item_array[step]
							# # 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
							end
							step = up_one(step)
							# # agent : para 01
							pdf.bounding_box([ place_array[step][0], place_array[step][1]], :width => 530, :height => 60) do
								pdf.text item_array[step].chomp
							# # 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
							end
							step = up_one(step)
							# # # para LIST
							pdf.bounding_box([ place_array[step][0], place_array[step][1]], :width => 530, :height => 60) do
								pdf.text item_array[step].chomp
							# # 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
							end
							step = up_one(step)
							# # text item_array[step]
							# # # # end
							
							# # #para 2
							pdf.bounding_box([ place_array[step][0], place_array[step][1] ], :width => 530, :height => 80) do
								pdf.text item_array[step].chomp
							# # 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
							end
							step = up_one(step) 
							# # #para CLOSE ADDRESS
							pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 80) do
							# 	pdf.text item_array[step]
								pdf.text para_Book.chomp
							# # 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
							end
							step = up_one(step)
							# # # closing 
							pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 40) do
							# 	pdf.text closing
								pdf.text sign_from
							# # 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
							end
							step = up_one(step)
							# # # footer
							pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 30) do
								pdf.text item_array[step].chomp #, :size => 10
							# # 	pdf.text item_array[step].to_s
							# # 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
							end
							step = up_one(step)
							# #sign to
							# pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 30) do
							# 	pdf.text item_array[step].to_s
							# # 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
							# end
							# step = up_one(step)
							# #spacer 
							# pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 30) do
							# 	pdf.text item_array[step].to_s
							# # 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
							# end

							pdf.bounding_box([10, 10], :width => 490, :height => 40) do
								# pdf.font "arial"
								pdf.text footer.chomp.to_s, :inline_format => true, :size => 10, :align => :center
								# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
							end
						
						#page 2 prom note
						pdf.start_new_page
						##########################################################################################
								step = up_one(step)
									#  title

									# pdf.bounding_box([ 210, 710],{ :width => 530, :height => 40}) do
									pdf.text " PROMISSORY NOTE ", style: :bold, :align => :center
									 	# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
									# end

									pdf.bounding_box([ place_array[step][0], place_array[step][1]],{ :width => 530, :height => 40}) do
										pdf.text total_amount
									#  	# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
									end
									step = up_one(step)
									
									# #sign to
									pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 30) do
										pdf.text start_date
									# # 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
									end
									step = up_one(step)

									# #location 
									pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 30) do
										pdf.text item_array[step].to_s.chomp
									# # 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
									end
									step = up_one(step)

									# #section 
									pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 30) do
										pdf.text item_array[step].to_s.chomp
									# # 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
									end
									step = up_one(step)

									pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 110) do
										pdf.text promise.chomp, :inline_format => true
									# # 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
									end
									step = up_one(step)

								    pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 110) do
										pdf.text item_array[step].chomp.to_s, :inline_format => true
									# # 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
									end
									step = up_one(step)

								    pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 460, :height => 140) do
										# pdf.font "arial" 
										pdf.text sect_02, :inline_format => true #, size: 10
									# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
									end
									step = up_one(step)
									
									pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 30) do
										# pdf.font "arial", size: 11
										pdf.text item_array[step].to_s
									# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
									end
									step = up_one(step)

									pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 200) do
										pdf.text sect_03, :inline_format => true #, size: 12
									# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
									end 
									step = up_one(step)

									pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 100) do
										pdf.text item_array[step].to_s, :inline_format => true
									# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
									end
									step = up_one(step)


									pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 100) do
										pdf.text item_array[step].to_s, :inline_format => true
									# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
									end
									step = up_one(step)

									pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 100) do
										# pdf.font "arial"
										pdf.text item_array[step], :inline_format => true, :size => 10, :align => :center
									# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
									end
									step = up_one(step)

									# pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 100) do
									# 	pdf.text item_array[step].to_s, :inline_format => true
									# # 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
									# end
									# step = up_one(step)

						# page 03
						##########################################################################################
						pdf.start_new_page

									pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 510, :height => 100) do
										# pdf.font "arial"
										pdf.text sect_04, size: 12
										# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
									end
									step = up_one(step)
									pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 510, :height => 100) do
										# pdf.font "arial"
										pdf.text sect_05.to_s, :inline_format => true
										# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
									end
									step = up_one(step)
									pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 510, :height => 130) do
										# pdf.font "arial"
										pdf.text sect_06.to_s, :inline_format => true
										# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
									end
									step = up_one(step)
									pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 510, :height => 150) do
										# pdf.font "arial"
										pdf.text sect_07.to_s, :inline_format => true
										# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
									end
									step = up_one(step)

									pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 510, :height => 300) do
									# pdf.font "arial"
									pdf.text sect_08.to_s, :inline_format => true
										# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
									end
									step = up_one(step)
									pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 100) do
									# pdf.font "arial"
										next_line = pdf.text item_array[step].to_s, :inline_format => true
									# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
									end
									step = up_one(step)

									pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 510, :height => 30) do
									# pdf.font "arial"
										pdf.text item_array[step].to_s, :inline_format => true, :size => 10, :align => :center
									# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
									end
									step = up_one(step)


						# page 04
						##########################################################################################
						pdf.start_new_page

							pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 300) do
								# pdf.font "arial"
								next_line = pdf.text item_array[step].to_s, :inline_format => true
								# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
							end
							step = up_one(step)

							pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 300) do
								# pdf.font "arial"
								pdf.text item_array[step].to_s, :inline_format => true
								# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
							end
							step = up_one(step)

							pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 150) do
								# pdf.font "arial"
								pdf.text item_array[step].to_s, :inline_format => true
							# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
							end
							step = up_one(step)

							pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 100) do
								# pdf.font "arial"
								pdf.text item_array[step].to_s, :inline_format => true
							# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
							end
							step = up_one(step)


							pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 100) do
								# pdf.font "arial"
								pdf.text item_array[step].to_s, :inline_format => true, :size => 10, :align => :center
							# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
							end
							step = up_one(step)


						# page 05
						##########################################################################################
						pdf.start_new_page
								pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 100) do
									# pdf.font "arial"
									pdf.text item_array[step].to_s, :inline_format => true
								# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
								end
								step = up_one(step)

								pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 100) do
									# pdf.font "arial"
									pdf.text item_array[step].to_s, :inline_format => true
								# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
								end
								step = up_one(step)

								pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 100) do
									# pdf.font "arial"
									pdf.text item_array[step].to_s, :inline_format => true, :size => 10, :align => :center
								# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
								end
								step = up_one(step)

						# page 06
						##########################################################################################
						pdf.start_new_page

							pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 100) do
								# pdf.font "arial"
								pdf.text item_array[step].to_s, :inline_format => true
							# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
							end
							step = up_one(step)

							pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 30) do
								# pdf.font "arial"
								pdf.text sign_from_B.to_s, :inline_format => true
								# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
							end
							step = up_one(step)

							pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 100) do
								# pdf.font "arial"
								pdf.text item_array[step].to_s, :inline_format => true
								# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
							end
							step = up_one(step)

							pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 200) do
								# pdf.font "arial"
								pdf.text item_array[step].to_s, :inline_format => true, :size => 10, :align => :center
								# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
							end
							step = up_one(step)

						# page 07
						##########################################################################################
						pdf.start_new_page

									pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 40) do
										# pdf.font "arial"
										pdf.text item_array[step].to_s, :inline_format => true, style: :bold, :align => :center
										# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
									end
									step = up_one(step)

									pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 30) do
										# pdf.font "arial"
										pdf.text item_array[step].to_s, :inline_format => true
										# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
									end
									step = up_one(step)

									pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 30) do
										# pdf.font "arial"
										pdf.text item_array[step].to_s, :inline_format => true, :size => 10, :align => :center
										# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
									end
									step = up_one(step)

						# page 08
						##########################################################################################
						pdf.start_new_page

									pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 30) do
										# pdf.font "arial"
										pdf.text item_array[step].to_s, :inline_format => true, style: :bold, :align => :center
										# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
									end
									step = up_one(step)


									pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 100) do
										# pdf.font "arial"
										pdf.text item_array[step].to_s, :inline_format => true
										# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
									end
									step = up_one(step)


									pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 300, :height => 200) do
										# pdf.font "arial"
										pdf.text fill_form.to_s, :inline_format => true
										# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
									end
									step = up_one(step)

									pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 200) do
										# pdf.font "arial"
										pdf.text item_array[step].to_s, :inline_format => true
										# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
									end
									step = up_one(step)

									pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 200) do
										# pdf.font "arial"
										pdf.text item_array[step].to_s, :inline_format => true
										# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
									end
									step = up_one(step)


									pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 300, :height => 300) do
										# pdf.font "arial"
										pdf.text item_array[step].to_s, :inline_format => true, :size => 10
										# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
									end
									step = up_one(step)


									pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 300) do
										# pdf.font "arial"
										pdf.text item_array[step].to_s, :inline_format => true, :size => 10
										# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
									end
									step = up_one(step)


									pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 300) do
										# pdf.font "arial"
										pdf.text item_array[step].to_s, :inline_format => true, :size => 10
										# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
									end
									step = up_one(step)


									pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 300) do
										# pdf.font "arial"
										pdf.text item_array[step].to_s, :inline_format => true, :size => 10
										# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
									end
									step = up_one(step)


									pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 300) do
										# pdf.font "arial"
										pdf.text item_array[step].to_s, :inline_format => true, :size => 10
										# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
									end
									step = up_one(step)


									pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 300) do
										# pdf.font "arial"
										pdf.text item_array[step].to_s, :inline_format => true, :size => 10, :align => :center
										# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
									end
									step = up_one(step)

						# page 09
						##########################################################################################
						pdf.start_new_page


								pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 30) do
									# pdf.font "arial"
									pdf.text item_array[step].to_s, :inline_format => true, :size => 12, style: :bold, :align => :center
									# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
								end
								step = up_one(step)


								pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 490, :height => 40) do
									# pdf.font "arial"
									pdf.text item_array[step].to_s, :inline_format => true, :size => 11,:align => :right
									# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
								end
								step = up_one(step)

								pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 490, :height => 40) do
									# pdf.font "arial"
									pdf.text item_array[step].to_s, :inline_format => true, :size => 11
									# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
								end
								step = up_one(step)

								pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 490, :height => 40) do
									# pdf.font "arial"
									pdf.text item_array[step].to_s, :inline_format => true, :size => 11
									# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
								end
								step = up_one(step)


								pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 490, :height => 40) do
									# pdf.font "arial"
									pdf.text item_array[step].to_s, :inline_format => true, :size => 11
									# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
								end
								step = up_one(step)

								pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 490, :height => 40) do
									# pdf.font "arial"
									pdf.text fill_name .to_s, :inline_format => true, :size => 11
									# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
								end
								step = up_one(step)


								pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 490, :height => 40) do
									# pdf.font "arial"
									pdf.text item_array[step].to_s, :inline_format => true, :size => 10, :align => :center
													# , :inline_format => true, :size => 12, style: :bold, :align => :center
									# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
								end
								step = up_one(step)

						# page 10
						##########################################################################################
						pdf.start_new_page

									pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 490, :height => 40) do
										# pdf.font "arial"
										pdf.text item_array[step].to_s, :inline_format => true, style: :bold, :size => 11, :align => :center
										# , :inline_format => true, :size => 12, style: :bold
										# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
									end
									step = up_one(step)
									pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 490, :height => 100) do
										# pdf.font "arial"
										pdf.text guar_A.to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
														# , :inline_format => true, :size => 12, style: :bold, :align => :center
										# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
									end
									step = up_one(step)
									
									pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 100) do
										# pdf.font "arial"
										pdf.text item_array[step].to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
														# , :inline_format => true, :size => 12, style: :bold, :align => :center
										# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
									end
									step = up_one(step)

									
									pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 140) do
										# pdf.font "arial"
										pdf.text item_array[step].to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
														# , :inline_format => true, :size => 12, style: :bold, :align => :center
										# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
									end
									step = up_one(step)
									
									
									pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 140) do
										# pdf.font "arial"
										pdf.text item_array[step].to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
														# , :inline_format => true, :size => 12, style: :bold, :align => :center
										# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
									end
									step = up_one(step)

									pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 140) do
										# pdf.font "arial"
										pdf.text item_array[step].to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
														# , :inline_format => true, :size => 12, style: :bold, :align => :center
										# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
									end
									step = up_one(step)
									
									pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 100) do
										# pdf.font "arial"
										pdf.text item_array[step].to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
														# , :inline_format => true, :size => 12, style: :bold, :align => :center
										# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
									end
									step = up_one(step)
									
									pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 100) do
										# pdf.font "arial"
										pdf.text item_array[step].to_s, :inline_format => true, :size => 10, :align => :center
														# , :inline_format => true, :size => 12, style: :bold, :align => :center
										# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
									end
									step = up_one(step)
									
									# pdf.bounding_box([10, 10], :width => 490, :height => 40) do
									# 	# pdf.font "arial"
									# 	pdf.text footer.to_s, :inline_format => true, :size => 10
									# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
									# end


						# page 11
						##########################################################################################
						pdf.start_new_page
							
								pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 100) do
									# pdf.font "arial"
									pdf.text item_array[step].to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
													# , :inline_format => true, :size => 12, style: :bold, :align => :center
									# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
								end
								step = up_one(step)

								pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 100) do
									# pdf.font "arial"
									pdf.text item_array[step].to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
													# , :inline_format => true, :size => 12, style: :bold, :align => :center
									# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
								end
								step = up_one(step)

								pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 100) do
									# pdf.font "arial"
									pdf.text item_array[step].to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
													# , :inline_format => true, :size => 12, style: :bold, :align => :center
									# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
								end
								step = up_one(step)

								pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 100) do
									# pdf.font "arial"
									pdf.text item_array[step].to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
													# , :inline_format => true, :size => 12, style: :bold, :align => :center
									# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
								end
								step = up_one(step)

								pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 100) do
									# pdf.font "arial"
									pdf.text item_array[step].to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
													# , :inline_format => true, :size => 12, style: :bold, :align => :center
									# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
								end
								step = up_one(step)

								pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 100) do
									# pdf.font "arial"
									pdf.text guar_A_date.to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
													# , :inline_format => true, :size => 12, style: :bold, :align => :center
									# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
								end
								step = up_one(step)

								pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 100) do
									# pdf.font "arial"
									pdf.text item_array[step].to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
													# , :inline_format => true, :size => 12, style: :bold, :align => :center
									# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
								end
								step = up_one(step)

								pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 40) do
									# pdf.font "arial"
									pdf.text sign_01.to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
													# , :inline_format => true, :size => 12, style: :bold, :align => :center
									# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
								end
								step = up_one(step)

								pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 30) do
									# pdf.font "arial"
									pdf.text item_array[step].to_s, :inline_format => true, :size => 12, style: :bold, :align => :center
													# , :inline_format => true, :size => 12, style: :bold, :align => :center
									# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
								end
								step = up_one(step)

								pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 100) do
									# pdf.font "arial"
									pdf.text guar_B.to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
													# , :inline_format => true, :size => 12, style: :bold, :align => :center
									# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
								end
								step = up_one(step)

								pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 100) do
									# pdf.font "arial"
									pdf.text item_array[step].to_s, :inline_format => true, :size => 10, :align => :center
													# , :inline_format => true, :size => 12, style: :bold, :align => :center
									# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
								end
								step = up_one(step)

						# page 12
						##########################################################################################
						pdf.start_new_page

								pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 60) do
									# pdf.font "arial"
									pdf.text item_array[step].to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
													# , :inline_format => true, :size => 12, style: :bold, :align => :center
									# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
								end
								step = up_one(step)

								pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 160) do
									# pdf.font "arial"
									pdf.text item_array[step].to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
													# , :inline_format => true, :size => 12, style: :bold, :align => :center
									# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
								end
								step = up_one(step)

								pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 160) do
									# pdf.font "arial"
									pdf.text item_array[step].to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
													# , :inline_format => true, :size => 12, style: :bold, :align => :center
									# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
								end
								step = up_one(step)

								pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 200) do
									# pdf.font "arial"
									pdf.text item_array[step].to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
													# , :inline_format => true, :size => 12, style: :bold, :align => :center
									# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
								end
								step = up_one(step)

								pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 200) do
									# pdf.font "arial"
									pdf.text item_array[step].to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
													# , :inline_format => true, :size => 12, style: :bold, :align => :center
									# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
								end
								step = up_one(step)

								pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 150) do
									# pdf.font "arial"
									pdf.text item_array[step].to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
													# , :inline_format => true, :size => 12, style: :bold, :align => :center
									# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
								end
								step = up_one(step)

								pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 150) do
									# pdf.font "arial"
									pdf.text item_array[step].to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
													# , :inline_format => true, :size => 12, style: :bold, :align => :center
									# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
								end
								step = up_one(step)

								pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 150) do
									# pdf.font "arial"
									pdf.text item_array[step].to_s, :inline_format => true, :size => 10, :align => :center
													# , :inline_format => true, :size => 12, style: :bold, :align => :center
									# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
								end
								step = up_one(step)

						# page 13
						##########################################################################################
						pdf.start_new_page

								pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 150) do
									# pdf.font "arial"
									pdf.text item_array[step].to_s, :inline_format => true, :size => 11 
													# , :inline_format => true, :size => 12, style: :bold, :align => :center
									# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
								end
								step = up_one(step)

								pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 150) do
									# pdf.font "arial"
									pdf.text item_array[step].to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
													# , :inline_format => true, :size => 12, style: :bold, :align => :center
									# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
								end
								step = up_one(step)

								pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 150) do
									# pdf.font "arial"
									pdf.text item_array[step].to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
													# , :inline_format => true, :size => 12, style: :bold, :align => :center
									# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
								end
								step = up_one(step)

								pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 150) do
									# pdf.font "arial"
									pdf.text guar_B_date.to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
													# , :inline_format => true, :size => 12, style: :bold, :align => :center
									# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
								end
								step = up_one(step)

								pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 150) do
									# pdf.font "arial"
									pdf.text item_array[step].to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
													# , :inline_format => true, :size => 12, style: :bold, :align => :center
									# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
								end
								step = up_one(step)

								pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 150) do
									# pdf.font "arial"
									pdf.text item_array[step].to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
													# , :inline_format => true, :size => 12, style: :bold, :align => :center
									# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
								end
								step = up_one(step)

								pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 150) do
									# pdf.font "arial"
									pdf.text sign_02.to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
													# , :inline_format => true, :size => 12, style: :bold, :align => :center
									# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
								end
								step = up_one(step)

								pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 150) do
									# pdf.font "arial"
									pdf.text item_array[step].to_s, :inline_format => true, style: :bold, :size => 11, :align => :center
													# , :inline_format => true, :size => 12, style: :bold, :align => :center
									# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
								end
								step = up_one(step)

								pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 150) do
									# pdf.font "arial"
									pdf.text item_array[step].to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
													# , :inline_format => true, :size => 12, style: :bold, :align => :center
									# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
								end
								step = up_one(step)

								pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 150) do
									# pdf.font "arial"
									pdf.text item_array[step].to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
													# , :inline_format => true, :size => 12, style: :bold, :align => :center
									# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
								end
								step = up_one(step)

								pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 150) do
									# pdf.font "arial"
									pdf.text item_array[step].to_s, :inline_format => true, :size => 10, :align => :center
													# , :inline_format => true, :size => 12, style: :bold, :align => :center
									# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
								end
								step = up_one(step)

								# pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 150) do
								# 		# pdf.font "arial"
								# 		pdf.text item_array[step].to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
								# 						# , :inline_format => true, :size => 12, style: :bold, :align => :center
								# 		# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
								# 	end
								# 	step = up_one(step)

						# page 14
						##########################################################################################
						pdf.start_new_page

							pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 150) do
								# pdf.font "arial"
								pdf.text item_array[step].to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
												# , :inline_format => true, :size => 12, style: :bold, :align => :center
								# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
							end
							step = up_one(step)

							pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 150) do
								# pdf.font "arial"
								pdf.text item_array[step].to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
												# , :inline_format => true, :size => 12, style: :bold, :align => :center
								# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
							end
							step = up_one(step)

							pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 150) do
								# pdf.font "arial"
								pdf.text item_array[step].to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
												# , :inline_format => true, :size => 12, style: :bold, :align => :center
								# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
							end
							step = up_one(step)

							pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 150) do
								# pdf.font "arial"
								pdf.text item_array[step].to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
												# , :inline_format => true, :size => 12, style: :bold, :align => :center
								# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
							end
							step = up_one(step)

							pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 150) do
								# pdf.font "arial"
								pdf.text item_array[step].to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
												# , :inline_format => true, :size => 12, style: :bold, :align => :center
								# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
							end
							step = up_one(step)

							pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 150) do
								# pdf.font "arial"
								pdf.text item_array[step].to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
												# , :inline_format => true, :size => 12, style: :bold, :align => :center
								# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
							end
							step = up_one(step)

							pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 150) do
								# pdf.font "arial"
								pdf.text item_array[step].to_s, :inline_format => true, :size => 10, :align => :center
												# , :inline_format => true, :size => 12, style: :bold, :align => :center
								# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
							end
							step = up_one(step)

						# page 15
						##########################################################################################
						pdf.start_new_page

							pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 250) do
								# pdf.font "arial"
								pdf.text item_array[step].to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
												# , :inline_format => true, :size => 12, style: :bold, :align => :center
								# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
							end
							step = up_one(step)

							pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 250) do
								# pdf.font "arial"
								pdf.text item_array[step].to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
												# , :inline_format => true, :size => 12, style: :bold, :align => :center
								# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
							end
							step = up_one(step)


							pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 250) do
								# pdf.font "arial"
								pdf.text item_array[step].to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
												# , :inline_format => true, :size => 12, style: :bold, :align => :center
								# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
							end
							step = up_one(step)


							pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 250) do
								# pdf.font "arial"
								pdf.text guar_C_date.to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
												# , :inline_format => true, :size => 12, style: :bold, :align => :center
								# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
							end
							step = up_one(step)


							pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 250) do
								# pdf.font "arial"
								pdf.text item_array[step].to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
												# , :inline_format => true, :size => 12, style: :bold, :align => :center
								# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
							end
							step = up_one(step)


							pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 250) do
								# pdf.font "arial"
								pdf.text item_array[step].to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
												# , :inline_format => true, :size => 12, style: :bold, :align => :center
								# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
							end
							step = up_one(step)


							pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 250) do
								# pdf.font "arial"
								pdf.text sign_03.to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
												# , :inline_format => true, :size => 12, style: :bold, :align => :center
								# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
							end
							step = up_one(step)


							pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 250) do
									# pdf.font "arial"
								pdf.text item_array[step].to_s, :inline_format => true, :size => 10, :align => :center
												# , :inline_format => true, :size => 12, style: :bold, :align => :center
								# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
							end
							step = up_one(step)
								# pdf.font "arial" , size => 12
						# page 16
						##########################################################################################
						# pdf.start_new_page

						# pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 150) do
						# 		# pdf.font "arial"
						# 		pdf.text item_array[step].to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
						# 						# , :inline_format => true, :size => 12, style: :bold, :align => :center
						# 		# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
						# 	end
						# 	step = up_one(step)

						# pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 150) do
						# 		# pdf.font "arial"
						# 		pdf.text item_array[step].to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
						# 						# , :inline_format => true, :size => 12, style: :bold, :align => :center
						# 		# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
						# 	end
						# 	step = up_one(step)

						# pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 150) do
						# 		# pdf.font "arial"
						# 		pdf.text item_array[step].to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
						# 						# , :inline_format => true, :size => 12, style: :bold, :align => :center
						# 		# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
						# 	end
						# 	step = up_one(step)

						# pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 150) do
						# 		# pdf.font "arial"
						# 		pdf.text item_array[step].to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
						# 						# , :inline_format => true, :size => 12, style: :bold, :align => :center
						# 		# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
						# 	end
						# 	step = up_one(step)



						# pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 150) do
						# 		# pdf.font "arial"
						# 		pdf.text item_array[step].to_s, :inline_format => true, :size => 11, :indent_paragraphs => 60
						# 						# , :inline_format => true, :size => 12, style: :bold, :align => :center
						# 		# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
						# 	end
						# 	step = up_one(step)

						##########################################################################################
							# pdf.start_new_page
		end


		# Contract 4 Loan Confirmation
		def page_letter_4(pdf, item_array, place_array, records_array, rec_set)
			pdf.bounding_box([-30, 720], :width => 100, :height => 100, :at => [200, 550]) do
	            pdf.fill_color "ff0000"
	          	pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/images/logo_page.png"), :fit => [600, 1000], :at => [0, 160]
				end
	        	pdf.fill_color "000000"
	        end
	        # page sign lines
	        pdf.bounding_box([0, 0],{ :width => 200, :height => 100 }) do
				# pdf.rectangle [240, 350], 310, 2
				# pdf.fill_rectangle [10, 510],0, 0
				# pdf.fill_color "ff0000"
				# pdf.rectangle [310, 190], 180, 2
				# pdf.fill_rectangle [10, 100],0, 0
				# pdf.fill_rectangle [240, 510],0, 0
	        end
	        
	        def up_one(step)
	        	step = step + 1
	        	return step	
	        end

		    def number_to_currency(num)
			  "$#{num.to_s.gsub(/\d(?=(...)+$)/, '\0,')}"
			end

			PagePart.order('part_area ASC').reorder('id ASC')
			PageLayout.order('part_area ASC').reorder('id ASC')
			current_date = records_array.client_first_name.to_s
			my_string = item_array[0].to_s
			groupName = Time.new


			groupName = groupName.localtime.strftime('  %b %d, %Y')
			say_date = my_string.gsub('#{current_date}', groupName )

			comp_address =  records_array.address_street;
			comp_address_state = records_array.address_city + ", " + records_array.address_state + " " + records_array.address_zip;

			law_header = item_array[1].to_s
			# law_header = item_array[2].to_s
			confirm = item_array[2].to_s
			full_name = records_array.client_first_name + " " + records_array.client_last_name
			head_name = full_name			
			agency = item_array[4].to_s
			agency = agency.gsub('#{agent_code}', records_array.agent_num )

			para_A = item_array[6].to_s
			para_A = para_A.sub('#{full_name}', head_name )
			para_A = para_A.sub('#{first_name}', records_array.client_first_name )
			para_A = para_A.sub('#{company}',  records_array.loan_name)
			




			tag_height = 14
			# step = up_one(step) 
			step = 0

			def get_page_loc(step, place_array, pdf, var_x, var_y)
				# move_l = place_array[step][0].to_f
				# move_r = 750.00
				var_x = place_array[step][0]
				var_y = place_array[step][1]
			
					
				pdf.indent 320, 0 do
					pdf.stroke_color '000000'
					pdf.stroke_bounds
					pdf.text_box step.to_s + " - : " + place_array[step][0].to_s + " : w, " + place_array[step][1].to_s + " : h, ", {:size => 12, :color => "ff0000" }
					# pdf.text 
					# pdf.text place_array[step][1].to_s
					pdf.line_to [var_x, var_y]
				end
					# pdf.rectangle [var_x, var_y], 100, 200
				# end
			end
			# page layout area  : Area 1
			pdf.bounding_box([ place_array[step][0], place_array[step][1]],{ :width => 430, :height => 16}) do
				pdf.text say_date, {:color => "000000"}
				# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
	        end
			step = up_one(step)
			 # name : Area 2
			pdf.bounding_box([ place_array[step][0], place_array[step][1]],{ :width => 430, :height => 100}) do
				pdf.text law_header , {:color => "000000"}
				# pdf.text full_name , {:color => "000000"}
				# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
			end
			step = up_one(step)

			# Client info 3
			pdf.bounding_box([  place_array[step][0], place_array[step][1] ], :width => 430, :height => 20) do
				pdf.text confirm 
				# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
			end
			step = up_one(step)  

			# address : Area 3
			pdf.bounding_box([ place_array[step][0],  place_array[step][1]  ], :width => 430, :height => 24) do
				# pdf.font "arial", size: 10 
				pdf.text head_name
				# pdf.text comp_address + " \n" + comp_address_state
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)			

			# reply : Area 4
			pdf.bounding_box([ place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
				# pdf.font "arial", size: 10 
				pdf.text agency
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)
			# # agent : Area 5 
			pdf.bounding_box([ place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
				pdf.text item_array[5].to_s
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)
			# intro : Area 6
			pdf.bounding_box([ place_array[step][0], place_array[step][1]], :width => 430, :height => 60) do
				# pdf.text intro 
				pdf.text para_A
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)
			# # text item_array[step]
			# # end
			
			#para 01 Area 7
			pdf.bounding_box([ place_array[step][0], place_array[step][1] ], :width => 430, :height => 80) do
				# pdf.text para_A
				pdf.text item_array[7].to_s
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step) 
			#para 02 : Area 8
			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 430, :height => 80) do
				# pdf.text para_B
				pdf.text item_array[8].to_s
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)
			# # #sign_to : Area 9
			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 430, :height => 60) do
				# pdf.text agency
				pdf.text item_array[9].to_s
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			# step = up_one(step)
			# # # #sign to 10
			# pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
			# # # 	# pdf.text item_array[step]
			# pdf.text item_array[step].to_s
				# pdf.text item_array[10].to_s
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			# end
			# step = up_one(step)
			# # #sign from 11
			# pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
			# 	pdf.text item_array[step].to_s
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			# end
		end


		# # commission form
		def page_letter_5(pdf, item_array, place_array, records_array, rec_set)
			# Service.page05_include
			# pdf.start_new_page

				pdf.bounding_box([-30, 720], :width => 100, :height => 100, :at => [200, 550]) do
		            pdf.fill_color "ff0000"
		          	pdf.transparent(1.0, 0.2) do 
						pdf.image open("app/assets/images/logo_page.png"), :fit => [600, 1000], :at => [0, 160]
					end
		        	pdf.fill_color "000000"
		        end
		        # page sign lines
		        pdf.bounding_box([0, 0],{ :width => 200, :height => 100 }) do
		        	pdf.stroke_color '00ff00'
					# pdf.stroke_bounds
		        	# pdf.rectangle [ 150, 690 ], 310, 2
		        	# pdf.rectangle [ 150, 670 ], 310, 2
		        	# pdf.rectangle [ 150, 650 ], 310, 2
		        	# pdf.fill_color "000000"
		        	pdf.stroke_color '000000'
		        	pdf.rectangle [190, 690], 110, 1
		        	pdf.rectangle [350, 690], 190, 1
				# address 
					pdf.rectangle [190, 670], 350, 1
		        	pdf.rectangle [250, 650], 290, 1

					pdf.rectangle [250, 630], 290, 1
				# phone email 	        	# 
		        	pdf.rectangle [190, 610], 60, 1
		        	pdf.rectangle [280, 610], 210, 1
				# lender info 
		        	pdf.rectangle [220, 570], 320, 1
		        	pdf.rectangle [220, 550], 320, 1
		        	pdf.rectangle [160, 530], 380, 1
		        	pdf.rectangle [160, 510], 380, 1

		        	pdf.rectangle [140, 490], 80, 1
		        	pdf.rectangle [250, 490], 280, 1
				# para 01
		        	pdf.rectangle [160, 440], 360, 3
				# form 2 agent sign 
		        	pdf.rectangle [250, 290], 290, 1
		        	pdf.rectangle [250, 270], 290, 1
		        	pdf.rectangle [190, 250], 90, 1

					# form C Lender sign
		        	pdf.rectangle [400, 190], 140, 1
		        	pdf.rectangle [400, 170], 140, 1
		        	pdf.rectangle [190, 150], 90, 1

					pdf.fill_rectangle [10, 510],0, 0

					# pdf.fill_color "ff0000"
					# pdf.rectangle [310, 190], 180, 2
					# pdf.fill_rectangle [10, 100],0, 0
					# pdf.fill_rectangle [240, 510],0, 0
					# pdf.bounds.top
		        end
		        
		        def up_one(step)
		        	step = step + 1
		        	return step	
		        end

			    def number_to_currency(num)
				  "$#{num.to_s.gsub(/\d(?=(...)+$)/, '\0,')}"
				end


					PagePart.order('part_area ASC').reorder('id ASC')
					PageLayout.order('part_area ASC').reorder('id ASC')

					my_string = item_array[0].to_s
					gettime = Time.new
					date = gettime.localtime.strftime('  %b %d, %Y')

					title = item_array[0].to_s
					# my_string.gsub('#{current_date}', groupName )

					comp_address =  records_array.address_street;
					comp_address_state = records_array.address_city + ", " + records_array.address_state + " " + records_array.address_zip;

					form_A_1 = 		item_array[1].to_s

					full_name = records_array.client_first_name.to_s  + " " + records_array.client_last_name.to_s 

					# form_A_1 = form_A_1.gsub('#{full_name}', "Moe" )

					form_A_1 = form_A_1.gsub('#{full_name}', records_array.loan_name.to_s )
					form_A_1 = form_A_1.gsub('#{agent_code}', records_array.agent_num )
				
					form_A_2 = 			item_array[2].to_s
					form_A_2 = 		form_A_2.gsub('#{full_name}', full_name )

					form_A_3 = 			item_array[3].to_s
					form_A_3 = 		form_A_3.gsub('#{address_street}', records_array.address_street )

					form_A_4 = 			item_array[4].to_s
					# form_A_4 = 		form_A_4.gsub('#{address_city}', "hello" )
					# form_A_4 = "hello"
					form_A_4 = 		form_A_4.gsub('#{address_city}', records_array.address_city )
					form_A_4 = 		form_A_4.gsub('#{address_state}', records_array.address_state )
					form_A_4 = 		form_A_4.gsub('#{address_zip}', records_array.address_zip )

					form_A_5 = 			item_array[5].to_s
					form_A_5 =		form_A_5.gsub('#{agent_phone}', records_array.agent_phone )
					form_A_5 =		form_A_5.gsub('#{agent_email}', records_array.agent_email )

					form_A_6 = 			item_array[6].to_s
					form_A_7 = 			item_array[7].to_s
					form_A_8 = 			item_array[8].to_s
					form_A_9 = 			item_array[9].to_s
					form_A_10 = 		item_array[10].to_s

					para_A = 			item_array[11].to_s
					# form B
					form_B_1 = 			item_array[12].to_s
					form_B_1 =		form_B_1.gsub('#{agent_name}', full_name )

					form_B_2 = 			item_array[13].to_s

					form_B_3 = 			item_array[14].to_s
					form_B_3 = 		form_B_3.gsub('#{current_date}', date )

					para_B = 			item_array[15].to_s

					form_C_1 = 			item_array[16].to_s
					form_C_2 = 			item_array[17].to_s

					form_C_3 = 			item_array[18].to_s
					form_C_3 = 			item_array[18].to_s
					form_C_3 = 		form_C_3.gsub('#{current_date}', date )

					tag_height = 14
					# step = up_one(step) 
					step = 0

				def get_page_loc(step, place_array, pdf, var_x, var_y)
					# move_l = place_array[step][0].to_f
					# move_r = 750.00
					var_x = place_array[step][0]
					var_y = place_array[step][1]
				
						
					# pdf.indent 320, 0 do
					# 	pdf.stroke_color 'FFFF00'
					# 	pdf.stroke_bounds
					# 	pdf.text_box step.to_s + " - : " + place_array[step][0].to_s + " : w, " + place_array[step][1].to_s + " : h, ", {:size => 12, :color => "ff0000" }
					# 	# pdf.text 
					# 	# pdf.text place_array[step][1].to_s
					# 	pdf.line_to [var_x, var_y]
					# end
						# pdf.rectangle [var_x, var_y], 100, 200
					# end
				end
				# page layout area  : Area 1
				pdf.bounding_box([ place_array[step][0], place_array[step][1]],{ :width => 200, :height => 30}) do
					# pdf.stroke_color 'FF0000'
					# pdf.stroke_bounds

					pdf.font "arial", size: 10 , style: :bold
					pdf.text title, {:color => "000000" , :character_spacing => 0.5}
					
					# pdf.font "Arial", size: 10 

					# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
 					# pdf.bounding_box.transparent(0.5) { stroke_bounds }

		        end
				step = up_one(step)
				
				# Form line 1
				pdf.bounding_box([ place_array[step][0], place_array[step][1]],{ :width => 430, :height => 16}) do
					
					# pdf.stroke_color 'FF0000'
					# pdf.stroke_bounds

					pdf.font "arial", size: 8 
					pdf.text form_A_1, {:color => "000000"  , :character_spacing => 0.5}
					# pdf.rectangle [ 150, 690 ], 310, 2
					# pdf.text form_A_2, {:color => "000000"}
					# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )

		        end
				step = up_one(step)
				
				pdf.bounding_box([ place_array[step][0], place_array[step][1]],{ :width => 300, :height => 16}) do
					
					# pdf.stroke_color 'FF0000'
					# pdf.stroke_bounds
					# pdf.font "arial", size: 8 
					pdf.text form_A_2, {:color => "000000"  , :character_spacing => 0.5}
					# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
 					# transparent(0.5) { stroke_bounds }
		        end
				step = up_one(step)

				pdf.bounding_box([ place_array[step][0], place_array[step][1]],{ :width => 400, :height => 16}) do

					# pdf.stroke_color 'FF0000'
					# pdf.stroke_bounds
					pdf.font "arial", size: 8 
					pdf.text form_A_3, {:color => "000000"}
					# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
		        end
				step = up_one(step)
				
				pdf.bounding_box([ place_array[step][0], place_array[step][1]],{ :width => 430, :height => 16}) do
					# pdf.stroke_color 'FF0000'
					# pdf.stroke_bounds
					
					pdf.font "arial", size: 8 
					pdf.text form_A_4, {:color => "000000"}
					# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
		        end
				step = up_one(step)

				pdf.bounding_box([ place_array[step][0], place_array[step][1]],{ :width => 430, :height => 16}) do
					pdf.font "arial", size: 8 
					pdf.text form_A_5, {:color => "000000"}
					# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
		        end
				step = up_one(step)

				pdf.bounding_box([ place_array[step][0], place_array[step][1]],{ :width => 430, :height => 16}) do
					pdf.font "arial", size: 8 
					pdf.text form_A_6, {:color => "000000"}
					# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
		        end
				step = up_one(step)

				pdf.bounding_box([ place_array[step][0], place_array[step][1]],{ :width => 430, :height => 16}) do
					pdf.font "arial", size: 8 
					pdf.text form_A_7, {:color => "000000"}
					# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
		        end
				step = up_one(step)

				pdf.bounding_box([ place_array[step][0], place_array[step][1]],{ :width => 430, :height => 16}) do
					pdf.font "arial", size: 8 
					pdf.text form_A_8, {:color => "000000"}
					# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
		        end
				step = up_one(step)

				pdf.bounding_box([ place_array[step][0], place_array[step][1]],{ :width => 430, :height => 16}) do
					pdf.text form_A_9, {:color => "000000"}
					# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
		        end
				step = up_one(step)

				pdf.bounding_box([ place_array[step][0], place_array[step][1]],{ :width => 430, :height => 16}) do
					pdf.text form_A_10, {:color => "000000"}
					# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
		        end
				step = up_one(step)

				pdf.bounding_box([ place_array[step][0], place_array[step][1]],{ :width => 400, :height => 100}) do
					pdf.text para_A, {:color => "000000", size: 8, :inline_format => "true" }
					pdf.font "arial", size: 8 
					# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
		        end
				step = up_one(step)


				pdf.bounding_box([ place_array[step][0], place_array[step][1]],{ :width => 430, :height => 16}) do
					pdf.text form_B_1, {:color => "000000",  size: 8}
					# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
		        end
				step = up_one(step)


				pdf.bounding_box([ place_array[step][0], place_array[step][1]],{ :width => 430, :height => 16}) do
					pdf.text form_B_2, {:color => "000000"}
					# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
		        end
				step = up_one(step)

				pdf.bounding_box([ place_array[step][0], place_array[step][1]],{ :width => 430, :height => 16}) do
					pdf.text form_B_3, {:color => "000000" }
					# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
		        end
				step = up_one(step)

				pdf.bounding_box([ place_array[step][0], place_array[step][1]],{ :width => 430, :height => 30}) do
					pdf.text para_B, {:color => "000000", size: 8, :inline_format => "true"  }
					# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
		        end
				step = up_one(step)

				pdf.bounding_box([ place_array[step][0], place_array[step][1]],{ :width => 430, :height => 16}) do
					pdf.text form_C_1, {:color => "000000" }
					# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
		        end
				step = up_one(step)

				pdf.bounding_box([ place_array[step][0], place_array[step][1]],{ :width => 430, :height => 16}) do
					pdf.text form_C_2, {:color => "000000"}
					# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
		        end
				step = up_one(step)

				pdf.bounding_box([ place_array[step][0], place_array[step][1]],{ :width => 430, :height => 16}) do
					pdf.font "arial", size: 8 
					pdf.text form_C_3, {:color => "000000", size: 8 }
					# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
		        end
				# step = up_one(step)
		end


		def page_letter_6(pdf,item_array,place_array,records_array, rec_set)
			pdf.bounding_box([-30, 720], :width => 100, :height => 100, :at => [200, 550]) do
	            pdf.fill_color "000000"
				pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/images/logo_page.png"), :fit => [600, 1000], :at => [0, 160]
				end
	           pdf.fill_color "000000"
	        end
	        # page sign lines
	        pdf.bounding_box([0, 90],{ :width => 100, :height => 100 }) do
				pdf.rectangle [110, 190], 180, 2
				pdf.fill_rectangle [10, 100],0, 0
				# pdf.fill_color "ff0000"
				pdf.rectangle [310, 190], 180, 2
				pdf.fill_rectangle [10, 100],0, 0
				# pdf.fill_rectangle [240, 510],0, 0
	        end
	        
	        def up_one(step)
	        	step = step + 1
	        	return step	
	        end

		    def number_to_currency(num)
			  "$#{num.to_s.gsub(/\d(?=(...)+$)/, '\0,')}"
			end
			PagePart.order('part_area ASC').reorder('id ASC')
			PageLayout.order('part_area ASC').reorder('id ASC')
			current_date = records_array.client_first_name.to_s
			my_string = item_array[0].to_s
			groupName = Time.new
			groupDate = groupName.localtime.strftime('%b %d, %Y')
			say_date = my_string.gsub('#{current_date}', groupDate )
			full_name = records_array.client_first_name + " " + records_array.client_last_name
			head_name = full_name
			full_name_show = head_name.gsub('#{full_name}', head_name )
			comp_address =  records_array.address_street;
			comp_address_state = records_array.address_city + ", " + records_array.address_state + " " + records_array.address_zip;

			agent_info = item_array[4].to_s
			agent_info = agent_info.gsub('#{full_name}', full_name )
			agent_info = agent_info.gsub('#{agent_code}', records_array.agent_num )

			intro = item_array[5]
			intro = intro.gsub('#{full_name}', full_name )

			para_A = item_array[6].to_s 
			para_A = para_A.sub('#{start_date}', records_array.repay_start.to_s  )
			para_A = para_A.sub('#{final_date}', records_array.repay_mature.to_s  )
			para_A = para_A.sub('#{start_date}', records_array.repay_start.to_s  )
			para_A = para_A.sub('#{current_date}', say_date  )

			reply = item_array[3].to_s
			st_date = records_array.repay_start.strftime("%B")
			# para_B = para_B.sub('#{start_month}', st_date )	
			sign_to = item_array[8].to_s 
			sign_to = sign_to.sub('#{full_name}', full_name )
			sign_to = sign_to.sub('#{agent_code}', records_array.agent_num )

			tag_height = 14
			# step = up_one(step) 
			step = 0

			def get_page_loc(step, place_array, pdf, var_x, var_y)
				var_x = place_array[step][0]
				var_y = place_array[step][1]
					
				pdf.indent 320, 0 do
					pdf.stroke_color '000000'
					pdf.stroke_bounds
					pdf.text_box step.to_s + " - : " + place_array[step][0].to_s + " : w, " + place_array[step][1].to_s + " : h, ", {:size => 12, :color => "ff0000" }
					pdf.line_to [var_x, var_y]
				end
					# pdf.rectangle [var_x, var_y], 100, 200
				# end
			end
			
    		# page layout 
			pdf.bounding_box([ place_array[step][0], place_array[step][1]],{ :width => 430, :height => 16}) do
				pdf.font "arial", size: 10 
				pdf.text say_date, {:color => "000000"}
				# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
	        end
			
			# skip client info
			# step = up_one(step)  
			# pdf.bounding_box( [ place_array[step][0], place_array[step][1] ] ),{ :width => 200, :height => 30}) do
			pdf.bounding_box([ place_array[step][0], place_array[step][1]],{ :width => 430, :height => 16}) do
				# get_page_loc(step, place_array, pdf);
				# pdf.text records_array.loan_name	
				# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
			end
			step = up_one(step)

			# Client info 2
			# pdf.bounding_box([  place_array[step][0], place_array[step][1] ], :width => 430, :height => 16) do
			# 	pdf.text records_array.loan_name , {:color => "000000"}
			# 	# get_page_loc(step, place_array, pdf, var_x, var_y);
			# 	get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )

			# end
			# step = up_one(step)  

			# info 3
			pdf.bounding_box([ place_array[step][0], place_array[step][1] ], :width => 430, :height => 16) do
			# 	pdf.text full_name_show , {:color => "000000"}
				pdf.text full_name , {:color => "000000"}
				# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
			end

			step = up_one(step)			
			# #Address 4
			pdf.bounding_box([ place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
				
				pdf.text comp_address + " \n" + comp_address_state
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end

			step = up_one(step)
			# # #intro 5
			pdf.bounding_box([ place_array[step][0], place_array[step][1]], :width => 430, :height => 16) do
				pdf.text reply
			# 	get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)
			# #para 01 6
			pdf.bounding_box([ place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
				pdf.text agent_info
			# 	# pdf.text item_array[5]
			# 	pdf.text para_A 
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			# # text item_array[step]
			# # end
			step = up_one(step)
			# #para 02 7
			pdf.bounding_box([ place_array[step][0], place_array[step][1] ], :width => 430, :height => 40) do
				# pdf.text item_array[step]
				pdf.text intro
			# 	get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			
			end

			step = up_one(step)
			# #para 02 7
			pdf.bounding_box([ place_array[step][0], place_array[step][1] ], :width => 430, :height => 40) do
				# pdf.text item_array[step]
				pdf.text para_A
			# 	get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			
			end
			step = up_one(step) 
			# #para 03 8
			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
				pdf.text item_array[step]
			# 	get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)
			# # #ender 9
			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
				# pdf.text item_array[step]
				pdf.text sign_to
			# 	get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)
			# # #sign to 10
			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
				pdf.text item_array[step]
			# 	pdf.text sign_to
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)
			# #sign from 11
			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
				pdf.text item_array[step]
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
		end


		def page_letter_7(pdf,item_array,place_array,records_array, rec_set)
			pdf.bounding_box([-30, 720], :width => 100, :height => 100, :at => [200, 550]) do
	            pdf.fill_color "ff0000"
				pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/images/logo_page.png"), :fit => [600, 1000], :at => [0, 160]
				end
	            pdf.fill_color "000000"
	        end
	        # page sign lines
	        pdf.bounding_box([0, 90],{ :width => 100, :height => 100 }) do
				pdf.rectangle [110, 290], 180, 2
				pdf.fill_rectangle [10, 100],0, 0
				# pdf.fill_color "ff0000"
				pdf.rectangle [310, 290], 180, 2
				pdf.fill_rectangle [10, 100],0, 0
				# pdf.fill_rectangle [240, 510],0, 0
	        end
	        
	        def up_one(step)
	        	step = step + 1
	        	return step	
	        end

		    def number_to_currency(num)
			  "$#{num.to_s.gsub(/\d(?=(...)+$)/, '\0,')}"
			end
			PagePart.order('part_area ASC').reorder('id ASC')
			PageLayout.order('part_area ASC').reorder('id ASC')
			current_date = records_array.client_first_name.to_s
			my_string = item_array[0].to_s
			groupName = Time.new
			groupName = groupName.localtime.strftime('%b %d, %Y')
			say_date = my_string.gsub('#{current_date}', groupName )
			full_name = records_array.client_first_name + " " + records_array.client_last_name
			head_name = full_name


			full_name_show = head_name.gsub('#{full_name}', head_name )
			comp_address =  records_array.address_street;
			comp_address_state = records_array.address_city + ", " + records_array.address_state + " " + records_array.address_zip
			address = item_array[2]
		
			intro = item_array[4]
			intro = intro.gsub('#{first_name}', records_array.client_first_name  )

			para_A = item_array[5].to_s 
			para_A = para_A.sub('#{full_name}', full_name )

			# # wash para B
			para_C = item_array[7].to_s
			para_C = para_C.sub('#{agent_code}', records_array.agent_num.to_s )
	
			sign_to = item_array[8].to_s 
			sign_to = sign_to.sub('#{full_name}', full_name )

			tag_height = 14
			# step = up_one(step) 
			step = 0

			def get_page_loc(step, place_array, pdf, var_x, var_y)
				var_x = place_array[step][0]
				var_y = place_array[step][1]
					
				pdf.indent 320, 0 do
					pdf.stroke_color '000000'
					pdf.stroke_bounds
					pdf.text_box step.to_s + " - : " + place_array[step][0].to_s + " : w, " + place_array[step][1].to_s + " : h, ", {:size => 12, :color => "ff0000" }
					pdf.line_to [var_x, var_y]
				end
			end
			
    		# page layout date
			pdf.bounding_box([ place_array[step][0], place_array[step][1]],{ :width => 430, :height => 16}) do
				pdf.font "arial", size: 10 	
				pdf.text say_date, {:color => "000000"}
			end
			
			# name
			step = up_one(step)  
			pdf.bounding_box([ place_array[step][0], place_array[step][1]],{ :width => 430, :height => 16}) do
				pdf.text full_name	
				# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
			end
			step = up_one(step)

			# Address 
			pdf.bounding_box([  place_array[step][0], place_array[step][1] ], :width => 430, :height => 24) do
				# 	pdf.text records_array.loan_name , {:color => "000000"}
				pdf.text comp_address + " \n" + comp_address_state
				end
			step = up_one(step)  

			# Re :
			pdf.bounding_box([ place_array[step][0], place_array[step][1] ], :width => 430, :height => 16) do
			# 	pdf.text full_name_show , {:color => "000000"}
				pdf.text  item_array[step]
			end

			step = up_one(step)			
			# intro 
			pdf.bounding_box([ place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
				pdf.text intro
			end

			step = up_one(step)
			# para 1
			pdf.bounding_box([ place_array[step][0], place_array[step][1]], :width => 430, :height => 16) do
				pdf.text para_A
			end
			step = up_one(step)
			# #para 01 6
			pdf.bounding_box([ place_array[step][0], place_array[step][1]], :width => 430, :height => 40) do
				pdf.text item_array[step]
			# 	# pdf.text item_array[5]
			# 	pdf.text para_A 
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			# text item_array[step]
			# # end
			step = up_one(step)
			# #para 02 7
			pdf.bounding_box([ place_array[step][0], place_array[step][1] ], :width => 430, :height => 40) do
				pdf.text para_C
			end
			step = up_one(step) 
			# #para 03 8
			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
				pdf.text sign_to
			# 	get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)
			# # #ender 9
			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
				pdf.text item_array[step]
			# 	get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)
			# # #sign to 10
			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
				pdf.text item_array[step]
			# 	pdf.text sign_to
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)
			# #sign from 11
			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 200, :height => 60) do
				pdf.text item_array[step]
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)
			# #sign from 11
			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 200, :height => 60) do
				pdf.text item_array[step]
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
		end


		# def page_letter_8(pdf,item_array,place_array,records_array, rec_set)
		# 	pdf.bounding_box([-30, 720], :width => 100, :height => 100, :at => [200, 550]) do

		#            pdf.fill_color "ff0000"

		# 		pdf.transparent(1.0, 0.2) do 
		# 			pdf.image open("app/assets/images/logo_page.png"), :fit => [600, 1000], :at => [0, 160]
		# 		end
		#           pdf.fill_color "000000"
		#        end
		#        # page sign lines
		#        pdf.bounding_box([0, 90],{ :width => 100, :height => 100 }) do
		# 		pdf.rectangle [110, 190], 180, 2
		# 		pdf.fill_rectangle [10, 100],0, 0
		# 		# pdf.fill_color "ff0000"
		# 		pdf.rectangle [310, 190], 180, 2
		# 		pdf.fill_rectangle [10, 100],0, 0
		# 		# pdf.fill_rectangle [240, 510],0, 0
		#        end
		    
		#        def up_one(step)
		#        	step = step + 1
		#        	return step	
		#        end

		#     def number_to_currency(num)
		# 	  "$#{num.to_s.gsub(/\d(?=(...)+$)/, '\0,')}"
		# 	end

		# 	PagePart.order('part_area ASC').reorder('id ASC')
		# 	PageLayout.order('part_area ASC').reorder('id ASC')
		# 	# current_date = records_array.client_first_name.to_s
		# 	my_string = item_array[0].to_s
		# 	groupName = Time.new
		# 	groupName = groupName.localtime.strftime('%b %d, %Y')
		# 	say_date = my_string.gsub('#{current_date}', groupName )
		# 	full_name = records_array.client_first_name + " " + records_array.client_last_name
		# 	head_name = full_name
		# 	full_name_show = head_name.gsub('#{full_name}', head_name )
		# 	comp_address =  records_array.address_street;
		# 	comp_address_state = records_array.address_city + ", " + records_array.address_state + " " + records_array.address_zip;

		# 	intro = item_array[4]
		# 	intro = intro.gsub('#{full_name}', full_name )

		# 	para_A = item_array[5].to_s 
		# 	para_A = para_A.sub('#{full_name}', full_name )

		# 	# wash para B
		# 	para_B = item_array[6].to_s
		# 	# find vars and replace 
		# 	para_B = para_B.sub('#{loan_rate}', records_array.stated_rate.to_s )
		# 	para_B = para_B.sub('#{total_loan}', number_to_currency(records_array.total_amount) )
		# 	st_date = records_array.repay_start.strftime("%B")
		# 	para_B = para_B.sub('#{start_month}', st_date )	
		# 	sign_to = item_array[9].to_s 
		# 	sign_to = sign_to.sub('#{full_name}', full_name )

		# 	tag_height = 14
		# 	# step = up_one(step) 
		# 	step = 0

		# 	def get_page_loc(step, place_array, pdf, var_x, var_y)
		# 		var_x = place_array[step][0]
		# 		var_y = place_array[step][1]
					
		# 		pdf.indent 320, 0 do
		# 			pdf.stroke_color 'FFFF00'
		# 			pdf.stroke_bounds
		# 			pdf.text_box step.to_s + " - : " + place_array[step][0].to_s + " : w, " + place_array[step][1].to_s + " : h, ", {:size => 12, :color => "ff0000" }
		# 			pdf.line_to [var_x, var_y]
		# 		end
		# 			# pdf.rectangle [var_x, var_y], 100, 200
		# 		# end
		# 	end
			
		#   		# page layout 
		# 	pdf.bounding_box([ place_array[step][0], place_array[step][1]],{ :width => 430, :height => 16}) do
		# 		# var_x = place_array[step][0]
		# 		# var_y = place_array[step][1]	
		# 		# pdf.bounding_box([ place_array[step][0], place_array[step][1] ] ), { :width => 200, :height => 300}) do
		# 		# pdf.font "/app/assets/fonts/times-Regular.ttf"
		# 		# pdf.text item_array[step], {:color => "00ff00"}
		# 		pdf.text say_date, {:color => "00ff00"}
		# 		# pdf.text place_array[step][0].to_s
		# 		# pdf.text place_array[step][1].to_s

		# 		get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
		#        end
			
		# 	# skip client info
		# 	# step = up_one(step)  
		# 	# pdf.bounding_box( [ place_array[step][0], place_array[step][1] ] ),{ :width => 200, :height => 30}) do
		# 	pdf.bounding_box([ place_array[step][0], place_array[step][1]],{ :width => 430, :height => 16}) do
		# 		# get_page_loc(step, place_array, pdf);
		# 		# pdf.text records_array.loan_name	
		# 		# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
		# 	end
		# 	step = up_one(step)

		# 	# Client info 2
		# 	pdf.bounding_box([  place_array[step][0], place_array[step][1] ], :width => 430, :height => 16) do
		# 		pdf.text records_array.loan_name , {:color => "000000"}
		# 		# get_page_loc(step, place_array, pdf, var_x, var_y);
		# 		get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )

		# 	end
		# 	step = up_one(step)  

		# 	# info 3
		# 	pdf.bounding_box([ place_array[step][0], place_array[step][1] ], :width => 430, :height => 16) do
		# 	# 	pdf.text full_name_show , {:color => "000000"}
		# 		pdf.text records_array.client_first_name , {:color => "000000"}
		# 		get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
		# 	end

		# 	step = up_one(step)			
		# 	# #Address 4
		# 	pdf.bounding_box([ place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
		# 		pdf.font "arial", size: 10 
		# 		pdf.text comp_address + " \n" + comp_address_state
		# 		get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
		# 	end

		# 	# step = up_one(step)
		# 	# # #intro 5
		# 	# pdf.bounding_box([ place_array[step][0], place_array[step][1]], :width => 430, :height => 16) do
		# 	# 	pdf.text intro
		# 	# 	get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
		# 	# end
		# 	# step = up_one(step)
		# 	# #para 01 6
		# 	# pdf.bounding_box([ place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
		# 	# 	# pdf.text item_array[step]
		# 	# 	# pdf.text item_array[5]
		# 	# 	pdf.text para_A 
		# 	# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
		# 	# end
		# 	# # text item_array[step]
		# 	# # end
		# 	# step = up_one(step)
		# 	# #para 02 7
		# 	# pdf.bounding_box([ place_array[step][0], place_array[step][1] ], :width => 430, :height => 40) do
				
		# 	# 	pdf.text para_B
		# 	# 	get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			
		# 	# end
		# 	# step = up_one(step) 
		# 	# #para 03 8
		# 	# pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
		# 	# 	pdf.text item_array[step]
		# 	# 	get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
		# 	# end
		# 	# step = up_one(step)
		# 	# # #ender 9
		# 	# pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
		# 	# 	pdf.text item_array[step]
		# 	# 	get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
		# 	# end
		# 	# step = up_one(step)
		# 	# # #sign to 10
		# 	# pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
		# 	# # 	# pdf.text item_array[step]
		# 	# 	pdf.text sign_to
		# 	# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
		# 	# end
		# 	# step = up_one(step)
		# 	# #sign from 11
		# 	# pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
		# 	# 	pdf.text item_array[step]
		# 	# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
		# 	# end
		# end

		def page_letter_8(pdf,item_array,place_array,records_array, rec_set)
			pdf.bounding_box([-30, 720], :width => 100, :height => 100, :at => [200, 550]) do

	            pdf.fill_color "ff0000"

				pdf.transparent(1.0, 0.2) do 
					# pdf.image open("app/assets/images/allstate_logo.png"), :fit => [300, 700], :at => [300, 760]
				end
	           pdf.fill_color "000000"
	        end
	        # page sign lines
	        pdf.bounding_box([0, 90],{ :width => 100, :height => 100 }) do
				# pdf.rectangle [110, 190], 180, 2
				# pdf.fill_rectangle [10, 100],0, 0
				# # pdf.fill_color "ff0000"
				# pdf.rectangle [310, 190], 180, 2
				# pdf.fill_rectangle [10, 100],0, 0
				# pdf.fill_rectangle [240, 510],0, 0
	        end
	        
	        def up_one(step)
	        	step = step + 1
	        	return step	
	        end

		    def number_to_currency(num)
			  "$#{num.to_s.gsub(/\d(?=(...)+$)/, '\0,')}"
			end
				# PagePart.order('part_area ASC').reorder('id ASC')
				# PageLayout.order('part_area ASC').reorder('id ASC')
				# current_date = records_array.client_first_name.to_s
				# my_string = item_array[0].to_s
				# groupName = Time.new
				# groupName = groupName.localtime.strftime('%b %d, %Y')
				# say_date = my_string.gsub('#{current_date}', groupName )
				# full_name = records_array.client_first_name + " " + records_array.client_last_name
				# head_name = full_name
				# full_name_show = head_name.gsub('#{full_name}', head_name )
				# comp_address =  records_array.address_street;
				# comp_address_state = records_array.address_city + ", " + records_array.address_state + " " + records_array.address_zip;

				# intro = item_array[4]
				# intro = intro.gsub('#{full_name}', full_name )

				# para_A = item_array[5].to_s 
				# para_A = para_A.sub('#{full_name}', full_name )

				# # wash para B
				# para_B = item_array[6].to_s
				# # find vars and replace 
				# para_B = para_B.sub('#{loan_rate}', records_array.stated_rate.to_s )
				# para_B = para_B.sub('#{total_loan}', number_to_currency(records_array.total_amount) )
				# st_date = records_array.repay_start.strftime("%B")
				# para_B = para_B.sub('#{start_month}', st_date )	
				# sign_to = item_array[9].to_s 
				# sign_to = sign_to.sub('#{full_name}', full_name )

				# tag_height = 14
				# step = up_one(step) 
			step = 0

			def get_page_loc(step, place_array, pdf, var_x, var_y)
				pdf.indent 320, 0 do
					pdf.stroke_color 'FFFF00'
					pdf.stroke_bounds
					pdf.text_box step.to_s + " - : " + place_array[step][0].to_s + " : w, " + place_array[step][1].to_s + " : h, ", {:size => 12, :color => "ff0000" }
					pdf.line_to [var_x, var_y]
				end
					# pdf.rectangle [var_x, var_y], 100, 200
				# end
			end
			
			# PAGE 01
 			pdf.bounding_box([70, 90],{ :width => 220, :height => 100 }) do
 				pdf.transparent(1.0, 0.2) do 
					# pdf.image open("app/assets/images/allstate_logo.png"), :fit => [200, 700], :at => [200, 760]
				end
 				pdf.fill_color '68d576'
				pdf.rectangle [0, 714], 400, 50
				pdf.fill_rectangle [10, 100],0, 0
				pdf.fill_color '000000'
	        end

    		# page Header 
			pdf.bounding_box([ place_array[step][0], place_array[step][1]],{ :width => 540, :height => 60}) do
				pdf.fill_color '000000'
				pdf.font "arial", size: 10
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 14, :align => :center
				# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
	        end
			step = up_one(step)
			# skip client info 02
			pdf.bounding_box([ place_array[step][0], place_array[step][1]],{ :width => 540, :height => 250}) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 9
			end
			step = up_one(step)

			# Client info 03
			pdf.bounding_box([  place_array[step][0], place_array[step][1] ], :width => 540, :height => 200) do
				# pdf.text records_array.loan_name , {:color => "000000"}
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 9
			end
			step = up_one(step)  

			# # info 04
			pdf.bounding_box([ place_array[step][0], place_array[step][1] ], :width => 500, :height => 200) do
			# 	pdf.text full_name_show , {:color => "000000"}
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 9
				# pdf.text records_array.client_first_name , {:color => "000000"}
				# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
			end

			step = up_one(step)			
			# # #Address 05
			pdf.bounding_box([ place_array[step][0], place_array[step][1]], :width => 500, :height => 100) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 9
				# pdf.font "arial", size: 10 
				# pdf.text comp_address + " \n" + comp_address_state
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end

			step = up_one(step)
			# # #intro 5
			pdf.bounding_box([ place_array[step][0], place_array[step][1]], :width => 500, :height => 350) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 9
			# # 	get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)
			# # #para 01 5 nums
			pdf.bounding_box([ place_array[step][0], place_array[step][1]], :width => 530, :height => 200) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 9
			# 	# pdf.text item_array[5]
			# 	# pdf.text para_A 
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			# text item_array[step]
			# # end
			step = up_one(step)
			# #para 02 7
			pdf.bounding_box([ place_array[step][0], place_array[step][1] ], :width => 500, :height => 100) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 9
			# 	pdf.text para_B
			# 	get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			
			end
			
			step = up_one(step)
			# #sign from 11
			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			# step = up_one(step)


			##########################################################################################
			pdf.start_new_page





			# PAGE 02
			# ##########################################################################################
			# pdf.bounding_box([0, 90],{ :width => 520, :height => 100 }) do
			# 	pdf.transparent(1.0, 0.2) do 
			# 		pdf.image open("app/assets/images/allstate_logo.png"), :fit => [150, 700], :at => [400, 750]
			# 	end
			# end
			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 9
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			# #sign from 13
			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 30) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 14, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)



			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 100) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)
			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 300) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 200) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 9, :skip_encoding => true
				 # :fallback_fonts => ["Times-Roman", "Kai"])
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 510, :height => 300) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 300) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 9

			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 300) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			##########################################################################################
			pdf.start_new_page





			# ##########################################################################################
			#PAGE 03
			pdf.bounding_box([0, 90],{ :width => 520, :height => 100 }) do
					pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/images/allstate_logo.png"), :fit => [250, 700], :at => [150, 760]
				end
				pdf.fill_color '68d576'
				pdf.rectangle [10, 694], 480, 40
				pdf.fill_rectangle [10, 100],0, 0

				pdf.rectangle [440, 754], 130, 46
				pdf.fill_rectangle [10, 100],0, 0

				pdf.fill_color '000000'
			end

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 120, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 100, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 460, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 12, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 100) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 9
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 100) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 9
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 500) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 9
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			# pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 300, :height => 60) do
			# 	pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# # 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			# end
			# step = up_one(step)


			# pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 300, :height => 60) do
			# 	pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# # 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			# end
			# step = up_one(step)


			# pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 300, :height => 60) do
			# 	pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# # 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			# end
			# step = up_one(step)


			# pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 300, :height => 60) do
			# 	pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# # 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			# end
			# step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			##########################################################################################
			pdf.start_new_page




			# PAGE 04
			# ##########################################################################################


			# pdf.bounding_box([0, 90],{ :width => 520, :height => 100 }) do
			# 		pdf.transparent(1.0, 0.2) do 
			# 		pdf.image open("app/assets/images/allstate_logo.png"), :fit => [200, 700], :at => [200, 760]
			# 	end
			# 		pdf.fill_color 'FF00FF'
			# 	pdf.rectangle [150, 714], 250, 20
			# 	pdf.fill_rectangle [10, 100],0, 0
			# 	pdf.fill_color '000000'
			# end
			#  AGENT LABEL
			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10, :fallback_fonts => ["arial"] , :color => "ff0000"
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)
			
			# main content 
			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 400) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 9
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			# lender label 
			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10, :color => "ff0000"
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			# Agent Sign
			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 100) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 9
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 100) do
				# pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 9, :color => "ff0000"
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 100) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 9
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 200) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 9
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			# pdf.bounding_box([30,460], :width => 500, :height => 100) do
			# 	pdf.text "<b>AGREEMENTS</b>", :inline_format => true, :size => 10, :align => :center
			# # 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			# end
			# step = up_one(step)

			# step = up_one(step)
			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 200) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 9
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 300) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 9
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)
			# # step = up_one(step)
		
			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 560, :height => 100) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)



			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			##########################################################################################
			pdf.start_new_page



			# #PAGE 05
			# ##########################################################################################

			pdf.bounding_box([0, 90],{ :width => 520, :height => 100 }) do
					pdf.transparent(1.0, 0.2) do 
					# pdf.image open("app/assets/images/allstate_logo.png"), :fit => [250, 700], :at => [150, 760]
				end
				pdf.fill_color '68d576'
				pdf.rectangle [120, 720], 280, 40
				pdf.fill_rectangle [10, 100],0, 0
				# pdf.stroke_bounds 
				# pdf.rectangle [440, 754], 130, 46
				# pdf.fill_rectangle [10, 100],0, 0

				pdf.fill_color '000000'
			end


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 11, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 340) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			
			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 200) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 100) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			##########################################################################################
			pdf.start_new_page





			# #PAGE 06
			# ##########################################################################################
			pdf.bounding_box([0, 90],{ :width => 520, :height => 100 }) do
				pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/images/allstate_logo.png"), :fit => [150, 700], :at => [400, 750]
				end
			end
			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 460) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)
			
			# FORM 
			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 440, :height => 200) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 300, :height => 100) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 220, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)




			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 300, :height => 100) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 220, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)



			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)



			# Where to Agency
			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 220, :height => 460) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 100) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 300, :height => 100) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 220, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 300, :height => 100) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 220, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)




			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 200, :height => 100) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 320, :height => 120) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 320, :height => 120) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			step = up_one(step) # skip row
			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)



			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)



			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			
			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)





			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 580, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)




			##########################################################################################
			pdf.start_new_page






			# #PAGE 07
			# ##########################################################################################
			pdf.bounding_box([0, 90],{ :width => 520, :height => 100 }) do
				pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/images/allstate_logo.png"), :fit => [200, 800], :at => [350, 730]
				end
			end


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

	
			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 250, :height => 100) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 250, :height => 100) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 250, :height => 100) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 250, :height => 100) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)



			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 250, :height => 100) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 250, :height => 100) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 250, :height => 100) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 250, :height => 100) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 310, :height => 100) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)




			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 250, :height => 100) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)




			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 250, :height => 100) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)



			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 250, :height => 100) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)



			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 250, :height => 100) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)



			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 250, :height => 100) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 580, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)




			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 540, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)




			# ##########################################################################################
			pdf.start_new_page





			# #PAGE 08

			# ##########################################################################################
			pdf.bounding_box([0, 90],{ :width => 520, :height => 100 }) do
					pdf.transparent(1.0, 0.2) do 
					# pdf.image open("app/assets/images/allstate_logo.png"), :fit => [250, 700], :at => [150, 760]
				end
				pdf.fill_color '68d576'
				pdf.rectangle [120, 716], 280, 40
				pdf.fill_rectangle [10, 100],0, 0
				# pdf.stroke_bounds 
				# pdf.rectangle [440, 754], 130, 46
				# pdf.fill_rectangle [10, 100],0, 0

				pdf.fill_color '000000'
			end


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 14, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)



			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 400, :height => 340) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 400, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


	 		pdf.bounding_box([-10, 90],{ :width => 560, :height => 100 }) do
				pdf.rectangle [30, 580], 510, 4
				pdf.fill_rectangle [10, 100],0, 0
				
		    end

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 400, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 12
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)



			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 400, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 12
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)



	 		pdf.bounding_box([-10, 90],{ :width => 560, :height => 100 }) do
				pdf.rectangle [30, 480], 510, 4
				pdf.fill_rectangle [10, 100],0, 0
				
		    end

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 400, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 12
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)



	 		pdf.bounding_box([-10, 90],{ :width => 560, :height => 100 }) do
				pdf.rectangle [30, 480], 510, 4
				pdf.fill_rectangle [10, 100],0, 0
				
		    end


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 400, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 12
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)



			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 9
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)



	 		pdf.bounding_box([-10, 90],{ :width => 560, :height => 100 }) do
				pdf.rectangle [30, 374], 510, 4
				pdf.fill_rectangle [10, 100],0, 0
				
		    end




			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)




			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)



			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)



			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)



			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)



			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)





			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			##########################################################################################
			pdf.start_new_page





			#PAGE 12
			##########################################################################################
			pdf.bounding_box([0, 90],{ :width => 520, :height => 100 }) do
				pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/images/allstate_logo.png"), :fit => [150, 700], :at => [400, 750]
				end
			end


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 210) do
				pdf.text item_array[step], :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 210) do
				pdf.text item_array[step], :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 210) do
				pdf.text item_array[step], :inline_format => true, :size => 8
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			##########################################################################################
			pdf.start_new_page







			#page 13
			##########################################################################################
			pdf.bounding_box([0, 90],{ :width => 520, :height => 100 }) do
				pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/images/allstate_logo.png"), :fit => [150, 700], :at => [400, 750]
				end
			end


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 210) do
				pdf.text item_array[step], :inline_format => true, :size => 12, :align => :center
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 210) do
				pdf.text item_array[step], :inline_format => true, :size => 10
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 210) do
				pdf.text item_array[step], :inline_format => true, :size => 10
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 210) do
				pdf.text item_array[step], :inline_format => true, :size => 10
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 210) do
				pdf.text item_array[step], :inline_format => true, :size => 10
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 210) do
				pdf.text item_array[step], :inline_format => true, :size => 10
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 210) do
				pdf.text item_array[step], :inline_format => true, :size => 10
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 210) do
				pdf.text item_array[step], :inline_format => true, :size => 10
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

		end



		# PAGE 09
		def page_letter_9(pdf,item_array,place_array,records_array, rec_set)
			pdf.bounding_box([-30, 720], :width => 100, :height => 100, :at => [200, 550]) do

	            pdf.fill_color "ff0000"

				pdf.transparent(1.0, 0.2) do 
					# pdf.image open("app/assets/images/allstate_logo.png"), :fit => [300, 700], :at => [300, 760]
				end
	           pdf.fill_color "000000"
	        end
	        # page sign lines
	        pdf.bounding_box([0, 90],{ :width => 100, :height => 100 }) do
				# pdf.rectangle [110, 190], 180, 2
				# pdf.fill_rectangle [10, 100],0, 0
				# # pdf.fill_color "ff0000"
				# pdf.rectangle [310, 190], 180, 2
				# pdf.fill_rectangle [10, 100],0, 0
				# pdf.fill_rectangle [240, 510],0, 0
	        end
	        
	        def up_one(step)
	        	step = step + 1
	        	return step	
	        end

		    def number_to_currency(num)
			  "$#{num.to_s.gsub(/\d(?=(...)+$)/, '\0,')}"
			end
			# PagePart.order('part_area ASC').reorder('id ASC')
			# PageLayout.order('part_area ASC').reorder('id ASC')
			# current_date = records_array.client_first_name.to_s
			# my_string = item_array[0].to_s
			# groupName = Time.new
			# groupName = groupName.localtime.strftime('%b %d, %Y')
			# say_date = my_string.gsub('#{current_date}', groupName )
			# full_name = records_array.client_first_name + " " + records_array.client_last_name
			# head_name = full_name
			# full_name_show = head_name.gsub('#{full_name}', head_name )
			# comp_address =  records_array.address_street;
			# comp_address_state = records_array.address_city + ", " + records_array.address_state + " " + records_array.address_zip;

			# intro = item_array[4]
			# intro = intro.gsub('#{full_name}', full_name )

			# para_A = item_array[5].to_s 
			# para_A = para_A.sub('#{full_name}', full_name )

			# # wash para B
			# para_B = item_array[6].to_s
			# # find vars and replace 
			# para_B = para_B.sub('#{loan_rate}', records_array.stated_rate.to_s )
			# para_B = para_B.sub('#{total_loan}', number_to_currency(records_array.total_amount) )
			# st_date = records_array.repay_start.strftime("%B")
			# para_B = para_B.sub('#{start_month}', st_date )	
			# sign_to = item_array[9].to_s 
			# sign_to = sign_to.sub('#{full_name}', full_name )

			# tag_height = 14
			# step = up_one(step) 
			step = 0

			def get_page_loc(step, place_array, pdf, var_x, var_y)
				pdf.indent 320, 0 do
					pdf.stroke_color 'FFFF00'
					pdf.stroke_bounds
					pdf.text_box step.to_s + " - : " + place_array[step][0].to_s + " : w, " + place_array[step][1].to_s + " : h, ", {:size => 12, :color => "ff0000" }
					pdf.line_to [var_x, var_y]
				end
					# pdf.rectangle [var_x, var_y], 100, 200
				# end
			end
			

 			pdf.bounding_box([0, 90],{ :width => 520, :height => 100 }) do
 				pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/images/allstate_logo.png"), :fit => [200, 700], :at => [200, 760]
				end
 				pdf.fill_color 'FF00FF'
				pdf.rectangle [140, 734], 310, 20
				pdf.fill_rectangle [10, 100],0, 0
				pdf.fill_color '000000'
	        end

    		# page Header 
			pdf.bounding_box([ place_array[step][0], place_array[step][1]],{ :width => 530, :height => 16}) do
				pdf.fill_color '000000'
				pdf.font "arial", size: 10
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 14, :align => :center
				# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
	        end
			step = up_one(step)
			# skip client info 02
			pdf.bounding_box([ place_array[step][0], place_array[step][1]],{ :width => 500, :height => 250}) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			end
			step = up_one(step)

			# Client info 03
			pdf.bounding_box([  place_array[step][0], place_array[step][1] ], :width => 500, :height => 200) do
				# pdf.text records_array.loan_name , {:color => "000000"}
				pdf.text item_array[step].chomp.to_s, :inline_format => true
			end
			step = up_one(step)  

			# info 04
			pdf.bounding_box([ place_array[step][0], place_array[step][1] ], :width => 500, :height => 200) do
			# 	pdf.text full_name_show , {:color => "000000"}
				pdf.text item_array[step].chomp.to_s, :inline_format => true
				# pdf.text records_array.client_first_name , {:color => "000000"}
				# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
			end

			step = up_one(step)			
			# # #Address 05
			pdf.bounding_box([ place_array[step][0], place_array[step][1]], :width => 500, :height => 100) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true
				# pdf.font "arial", size: 10 
				# pdf.text comp_address + " \n" + comp_address_state
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end

			step = up_one(step)
			# # #intro 5
			pdf.bounding_box([ place_array[step][0], place_array[step][1]], :width => 250, :height => 100) do
				pdf.text item_array[step]
			# # 	get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)
			# # #para 01 5 nums
			pdf.bounding_box([ place_array[step][0], place_array[step][1]], :width => 400, :height => 100) do
				pdf.text item_array[step]
			# 	# pdf.text item_array[5]
			# 	# pdf.text para_A 
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			# text item_array[step]
			# # end
			step = up_one(step)
			# #para 02 7
			pdf.bounding_box([ place_array[step][0], place_array[step][1] ], :width => 450, :height => 100) do
				pdf.text item_array[step]
			# 	pdf.text para_B
			# 	get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			
			end
			step = up_one(step) 
			# #para 03 8
			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 30) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true
			# 	get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)
			# # #ender 9
			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 300) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true
			# 	get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)
			# # #sign to 10
			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 400) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true
			# 	pdf.text sign_to
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)
			# #sign from 11
			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			step = up_one(step)


			##########################################################################################
			pdf.start_new_page








			##########################################################################################
			pdf.bounding_box([0, 90],{ :width => 520, :height => 100 }) do
				pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/images/allstate_logo.png"), :fit => [150, 700], :at => [400, 750]
				end
			end

			# #sign from 13
			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 30) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 14, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 100) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)
			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 300) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 100) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 380, :height => 300) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 480, :height => 300) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			##########################################################################################
			pdf.start_new_page









			##########################################################################################
			#PAGE 03
			pdf.bounding_box([0, 90],{ :width => 520, :height => 100 }) do
					pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/images/allstate_logo.png"), :fit => [200, 700], :at => [200, 760]
				end
				pdf.fill_color 'FF00FF'
				pdf.rectangle [110, 714], 310, 20
				pdf.fill_rectangle [10, 100],0, 0

				pdf.rectangle [440, 754], 130, 60
				pdf.fill_rectangle [10, 100],0, 0

				pdf.fill_color '000000'
			end

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 120, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 100, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 460, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 12, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 100) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 100) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 500) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 300, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 300, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 300, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 300, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			##########################################################################################
			pdf.start_new_page





			##########################################################################################


			pdf.bounding_box([0, 90],{ :width => 520, :height => 100 }) do
					pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/images/allstate_logo.png"), :fit => [200, 700], :at => [200, 760]
				end
					pdf.fill_color 'FF00FF'
				pdf.rectangle [150, 714], 250, 20
				pdf.fill_rectangle [10, 100],0, 0
				pdf.fill_color '000000'
			end


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 100) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 100) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 100) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 200) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end

			pdf.bounding_box([30,460], :width => 500, :height => 100) do
				pdf.text "<b>AGREEMENTS</b>", :inline_format => true, :size => 10, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 200) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 300) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)
			# step = up_one(step)
		
			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 300) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 300) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 300) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 300) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			##########################################################################################
			pdf.start_new_page








			#PAGE 05
			##########################################################################################
			pdf.bounding_box([0, 90],{ :width => 520, :height => 100 }) do
				pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/images/allstate_logo.png"), :fit => [150, 700], :at => [400, 750]
				end
			end



			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 300) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 340) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)
			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			##########################################################################################
			pdf.start_new_page





			#PAGE 06
			##########################################################################################
			pdf.bounding_box([0, 90],{ :width => 520, :height => 100 }) do
				pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/images/allstate_logo.png"), :fit => [150, 700], :at => [400, 750]
				end
			end
			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 460) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 200) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			##########################################################################################
			pdf.start_new_page






			#PAGE 07
			##########################################################################################
			pdf.bounding_box([0, 90],{ :width => 520, :height => 100 }) do
				pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/images/allstate_logo.png"), :fit => [150, 700], :at => [400, 750]
				end
			end

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 400) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 60) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			##########################################################################################
			pdf.start_new_page





			#PAGE 08

			##########################################################################################
			pdf.bounding_box([0, 90],{ :width => 520, :height => 100 }) do
				pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/images/allstate_logo.png"), :fit => [150, 700], :at => [400, 750]
				end
			end

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

	
			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			
			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			##########################################################################################
			pdf.start_new_page


			pdf.bounding_box([0, 90],{ :width => 520, :height => 100 }) do
				pdf.transparent(1.0, 0.2) do 
				pdf.image open("app/assets/images/allstate_logo.png"), :fit => [200, 700], :at => [200, 760]
			end
				pdf.fill_color 'FF00FF'
			pdf.rectangle [100, 718], 330, 35

			pdf.fill_rectangle [10, 100],0, 0
			pdf.fill_color '000000'
			end

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 11, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)



			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 260, :height => 100) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)



			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 500, :height => 100) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 560, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 560, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 560, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 580, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 560, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)
			#need to indent lines
			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 260) do
				pdf.text item_array[step], :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 260) do
				pdf.text item_array[step], :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 260) do
				pdf.text item_array[step], :inline_format => true, :size => 8
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 260) do
				pdf.text item_array[step], :inline_format => true, :size => 8
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 260) do
				pdf.text item_array[step], :inline_format => true, :size => 8
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 220, :height => 110) do
				pdf.text item_array[step], :inline_format => true, :size => 8
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 220, :height => 110) do
				pdf.text item_array[step], :inline_format => true, :size => 8
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 220, :height => 110) do
				pdf.text item_array[step], :inline_format => true, :size => 8
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)








			#PAGE 10
			##########################################################################################
			pdf.start_new_page

			pdf.bounding_box([0, 90],{ :width => 520, :height => 100 }) do
					pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/images/allstate_logo.png"), :fit => [200, 700], :at => [200, 750]
				end
					pdf.fill_color 'FF00FF'
				pdf.rectangle [100, 718], 330, 35

				pdf.fill_rectangle [10, 100],0, 0
				pdf.fill_color '000000'
			end

	 		pdf.bounding_box([0, 90],{ :width => 520, :height => 100 }) do
					pdf.rectangle [0, 760], 510, 6
					pdf.fill_rectangle [10, 100],0, 0
					
		        end


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 110) do
					pdf.text item_array[step], :inline_format => true, :size => 12, :align => :center
				# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
				end
				step = up_one(step)



			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 110) do
					pdf.text item_array[step], :inline_format => true, :size => 10
				# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
				end
				step = up_one(step)



			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 110) do
					pdf.text item_array[step], :inline_format => true, :size => 10
				# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
				end
				step = up_one(step)



	 		pdf.bounding_box([0, 90],{ :width => 520, :height => 100 }) do
					pdf.rectangle [10, 620], 510, 3
					pdf.fill_rectangle [10, 100],0, 0
					
		        end

	 		pdf.bounding_box([0, 90],{ :width => 520, :height => 100 }) do
					pdf.rectangle [10, 560], 510, 2
					pdf.fill_rectangle [10, 100],0, 0
					
		        end


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 110) do
					pdf.text item_array[step], :inline_format => true, :size => 10
				# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
				end
				step = up_one(step)



			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 110) do
					pdf.text item_array[step], :inline_format => true, :size => 10
				# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
				end
				step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 110) do
					pdf.text item_array[step], :inline_format => true, :size => 10
				# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
				end
				step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 110) do
					pdf.text item_array[step], :inline_format => true, :size => 10
				# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
				end
				step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 110) do
					pdf.text item_array[step], :inline_format => true, :size => 10
				# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
				end
				step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 110) do
					pdf.text item_array[step], :inline_format => true, :size => 10
				# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
				end
				step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 110) do
					pdf.text item_array[step], :inline_format => true, :size => 10
				# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
				end
				step = up_one(step)


	 		pdf.bounding_box([0, 90],{ :width => 520, :height => 100 }) do
					pdf.rectangle [0, 410], 510, 2
					pdf.fill_rectangle [10, 100],0, 0
					
		        end


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 110) do
					pdf.text item_array[step], :inline_format => true, :size => 10
				# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
				end
				step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 110) do
					pdf.text item_array[step], :inline_format => true, :size => 10
				# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
				end
				step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 110) do
					pdf.text item_array[step], :inline_format => true, :size => 10
				# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
				end
				step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 110) do
					pdf.text item_array[step], :inline_format => true, :size => 10
				# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
				end
				step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 110) do
					pdf.text item_array[step], :inline_format => true, :size => 10
				# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
				end
				step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 110) do
					pdf.text item_array[step], :inline_format => true, :size => 10
				# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
				end
				step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 110) do
					pdf.text item_array[step], :inline_format => true, :size => 8, :align => :center
				# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
				end
				step = up_one(step)



			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 110) do
					pdf.text item_array[step], :inline_format => true, :size => 10
				# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
				end
				step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 110) do
					pdf.text item_array[step], :inline_format => true, :size => 8, :align => :center
				# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
				end
				step = up_one(step)


	 		pdf.bounding_box([0, 90],{ :width => 520, :height => 100 }) do
					pdf.rectangle [0, 240], 510, 2
					pdf.fill_rectangle [10, 100],0, 0
					
		        end


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 110) do
					pdf.text item_array[step], :inline_format => true, :size => 10
				# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
				end
				step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 400, :height => 110) do
					pdf.text item_array[step], :inline_format => true, :size => 10
				# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
				end
				step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 110) do
					pdf.text item_array[step], :inline_format => true, :size => 10
				# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
				end
				step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 110) do
					pdf.text item_array[step], :inline_format => true, :size => 10
				# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
				end
				step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 110) do
					pdf.text item_array[step], :inline_format => true, :size => 10
				# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
				end
				step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
					pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
				# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
				end
				step = up_one(step)


			##########################################################################################
			pdf.start_new_page





			#PAGE 11
			##########################################################################################
			pdf.bounding_box([0, 90],{ :width => 520, :height => 100 }) do
				pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/images/allstate_logo.png"), :fit => [200, 700], :at => [400, 750]
				end
			end


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 110) do
					pdf.text item_array[step], :inline_format => true, :size => 11, :align => :center
				# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
				end
				step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 110) do
					pdf.text item_array[step], :inline_format => true, :size => 10
				# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
				end
				step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 110) do
					pdf.text item_array[step], :inline_format => true, :size => 10
				# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
				end
				step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 110) do
					pdf.text item_array[step], :inline_format => true, :size => 10
				# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
				end
				step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 110) do
					pdf.text item_array[step], :inline_format => true, :size => 10
				# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
				end
				step = up_one(step)



	 		pdf.bounding_box([0, 90],{ :width => 520, :height => 100 }) do
				pdf.rectangle [0, 580], 510, 2
				pdf.fill_rectangle [10, 100],0, 0
				
	        end

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 110) do
				pdf.text item_array[step], :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 110) do
				pdf.text item_array[step], :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 110) do
				pdf.text item_array[step], :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 110) do
				pdf.text item_array[step], :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 110) do
				pdf.text item_array[step], :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 110) do
				pdf.text item_array[step], :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)

			pdf.bounding_box([0, 90],{ :width => 470, :height => 100 }) do
				pdf.rectangle [0, 490], 510, 2
				pdf.fill_rectangle [10, 100],0, 0
				
	        end


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 110) do
				pdf.text item_array[step], :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)
			

			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 110) do
				# pdf.text item_array[step], :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 110) do
				pdf.text item_array[step], :inline_format => true, :size => 8
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 110) do
				pdf.text item_array[step], :inline_format => true, :size => 8
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 520, :height => 110) do
				pdf.text item_array[step], :inline_format => true, :size => 8
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 560, :height => 110) do
				pdf.text item_array[step], :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([0, 90],{ :width => 400, :height => 100 }) do
				pdf.rectangle [0, 400], 510, 2
				pdf.fill_rectangle [10, 100],0, 0
	        end


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 210) do
				pdf.text item_array[step], :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 210) do
				pdf.text item_array[step], :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 210) do
				pdf.text item_array[step], :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 210) do
				pdf.text item_array[step], :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 210) do
				pdf.text item_array[step], :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 210) do
				pdf.text item_array[step], :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 210) do
				pdf.text item_array[step], :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([0, 90],{ :width => 400, :height => 100 }) do
				pdf.rectangle [0, 30], 510, 2
				pdf.fill_rectangle [10, 100],0, 0
				
	        end


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			##########################################################################################
			pdf.start_new_page





			#PAGE 12
			##########################################################################################
			pdf.bounding_box([0, 90],{ :width => 520, :height => 100 }) do
				pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/images/allstate_logo.png"), :fit => [150, 700], :at => [400, 750]
				end
			end


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 210) do
				pdf.text item_array[step], :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 210) do
				pdf.text item_array[step], :inline_format => true, :size => 10
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 210) do
				pdf.text item_array[step], :inline_format => true, :size => 8
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			##########################################################################################
			pdf.start_new_page







			#page 13
			##########################################################################################
			pdf.bounding_box([0, 90],{ :width => 520, :height => 100 }) do
				pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/images/allstate_logo.png"), :fit => [150, 700], :at => [400, 750]
				end
			end


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 210) do
				pdf.text item_array[step], :inline_format => true, :size => 12, :align => :center
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 210) do
				pdf.text item_array[step], :inline_format => true, :size => 10
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 210) do
				pdf.text item_array[step], :inline_format => true, :size => 10
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 210) do
				pdf.text item_array[step], :inline_format => true, :size => 10
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 210) do
				pdf.text item_array[step], :inline_format => true, :size => 10
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 210) do
				pdf.text item_array[step], :inline_format => true, :size => 10
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 210) do
				pdf.text item_array[step], :inline_format => true, :size => 10
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 210) do
				pdf.text item_array[step], :inline_format => true, :size => 10
				# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)


			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 530, :height => 260) do
				pdf.text item_array[step].chomp.to_s, :inline_format => true, :size => 8, :align => :center
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)
		end

		# # Assignment of %
		def page_letter_10(pdf,item_array,place_array,records_array, rec_set)
			pdf.bounding_box([-30, 720], :width => 100, :height => 100, :at => [200, 550]) do
	            pdf.fill_color "ff0000"
				pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/images/logo_page.png"), :fit => [600, 1000], :at => [0, 160]
				end
            pdf.fill_color "000000"
	        end

	        # page sign lines
	        pdf.bounding_box([0, 90],{ :width => 100, :height => 100 }) do
				# pdf.rectangle [110, 190], 180, 2
				# pdf.fill_rectangle [10, 100],0, 0
				# # pdf.fill_color "ff0000"
				# pdf.rectangle [310, 190], 180, 2
				# pdf.fill_rectangle [10, 100],0, 0
				# pdf.fill_rectangle [240, 510],0, 0
	        end
	        
	        def up_one(step)
	        	step = step + 1
	        	return step	
	        end

		    def number_to_currency(num)
			  "$#{num.to_s.gsub(/\d(?=(...)+$)/, '\0,')}"
			end


			PagePart.order('part_area ASC').reorder('id ASC')
			PageLayout.order('part_area ASC').reorder('id ASC')
			# current_date = records_array.client_first_name.to_s
			# my_string = item_array[0].to_s
			# groupName = Time.new
			# groupName = groupName.localtime.strftime('%b %d, %Y')
			# say_date = my_string.gsub('#{current_date}', groupName )
			# full_name = records_array.client_first_name + " " + records_array.client_last_name
			# head_name = full_name
			# full_name_show = head_name.gsub('#{full_name}', head_name )
			# comp_address =  records_array.address_street;
			# comp_address_state = records_array.address_city + ", " + records_array.address_state + " " + records_array.address_zip;



			# intro = item_array[4]
			# intro = intro.gsub('#{first_name}', full_name )

			# para_A = item_array[5].to_s 
			# para_A = para_A.sub('#{full_name}', full_name )
			# para_A = para_A.sub('#{agent_code}', records_array.agent_num.to_s )
			# # para_A = para_A.sub('#{agent_code}', records_array.agent_num.to_s )
			# # wash para B
			# para_B = item_array[6].to_s
			# # find vars and replace 
			# para_B = para_B.sub('#{start_month}', records_array.repay_start.to_s )
			# para_B = para_B.sub('#{total_amount}', number_to_currency(records_array.total_amount) )
			# para_B = para_B.sub('#{percent_of}', "--unkown--" )
			# # st_date = records_array.repay_start.strftime("%B")
			# # para_B = para_B.sub('#{start_month}', st_date )	
			# sign_to = item_array[9].to_s 
			# sign_to = sign_to.sub('#{full_name}', full_name )

			tag_height = 14
			# step = up_one(step) 
			step = 0

			def get_page_loc(step, place_array, pdf, var_x, var_y)
				# var_x = place_array[step][0]
				# var_y = place_array[step][1]
					
				# pdf.indent 320, 0 do
				# 	pdf.stroke_color 'FFFF00'
				# 	pdf.stroke_bounds
				# 	pdf.text_box step.to_s + " - : " + place_array[step][0].to_s + " : w, " + place_array[step][1].to_s + " : h, ", {:size => 12, :color => "ff0000" }
				# 	pdf.line_to [var_x, var_y]
				# end
					# pdf.rectangle [var_x, var_y], 100, 200
				# end
			end
			
    		# page layout 
			pdf.bounding_box([ 110, 650],{ :width => 430, :height => 16}) do
				# var_x = place_array[step][0]
				# var_y = place_array[step][1]	
				# pdf.bounding_box([ place_array[step][0], place_array[step][1] ] ), { :width => 200, :height => 300}) do
				# pdf.font "/app/assets/fonts/times-Regular.ttf"
				# pdf.text item_array[step], {:color => "00ff00"}
				pdf.font "arial", size: 10
				# pdf.text say_date, {:color => "000000"}
				# pdf.text place_array[step][0].to_s
				# pdf.text place_array[step][1].to_s

				# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
	        end
			
			# skip client info
			# step = up_one(step)  
			# pdf.bounding_box( [ place_array[step][0], place_array[step][1] ] ),{ :width => 200, :height => 30}) do
			pdf.bounding_box([ 110, 550],{ :width => 430, :height => 100}) do
				# get_page_loc(step, place_array, pdf);
				# pdf.text records_array.loan_name	
				# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
			end
			step = up_one(step)
			# add_tab = para_A.sub('#{full_name}', full_name )
			# test page 
			# pdf.start_new_page




			# ##########################################################################################
			pdf.bounding_box([ 110, 750],{ :width => 530, :height => 750}) do
			# pdf.font "arial", size: 11
			# pdf.text say_date 
			# pdf.text address
			 pdf.table(	 	[ ["rec_set id", "value", "label", "label"],
			 				["#{ rec_set[0] }" , "0", "record name", "loan_name",],
			 				["#{ rec_set[1] }" , "1", "current date", "current_date"],
			 				["#{ rec_set[2] }" , "2", "First Name", "first_name"],
			 				["#{ rec_set[3] }" , "3", "Last Name", "last_name"],
			 				["#{ rec_set[4] }" , "4", "Nick Name", "nick_name"],
			 				["#{ rec_set[5] }" , "5", "Full Address ", "full address"],
			 				["#{ rec_set[6] }" , "6", "Sign Note Date ", "sign_note_date"],

			 				["#{ rec_set[7] }" , "7", "Loan Amount", "loan_amount"],
			 				["#{ rec_set[8] }" , "8", "Total Finance Fees", "total_finance_fee"],
			 				["#{ rec_set[9] }" , "9", "Repay Term Months", "repay_term1"],

			 				["#{ rec_set[10] }" , "10", "Repay Term :th", "repay_term2"],

			 				["#{ rec_set[11] }" , "11", "Repay Start", "repay_start"],
			 				["#{ rec_set[12] }" , "12", "Repay 1st payment ", "repay_1st"],
			 				["#{ rec_set[13] }" , "13", "Repay mature date ", "repay_mature"],

			 				["#{ rec_set[14] }" , "14", "Monthly Payment ", "monthly_pay"],
			 				["#{ rec_set[15] }" , "15", "Payment late after ", "pay_due_day"],
			 				["#{ rec_set[16] }" , "16", "Activation Fee ", "activate_fee"],

			 				["#{ rec_set[17] }%" , "17", "Loan Rate ", "loan_rate"],
			 				["#{ rec_set[18] }" , "18", "Monthly Late Fee ", "month_late"],
			 				["#{ rec_set[19] }" , "19", "Late payment", "daily_late_fee"],
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
			 				["#{ rec_set[33] }" , "33", "Monthly Penality ", "pay_pen"],
			 				["#{ rec_set[34] }" , "34", "Pre pay Penality ", "prepay_pen"],
			 			],  :cell_style => { :size => 9, :background_color => "828fbb" }

			 			) 



			# pdf.text "records list ", {:color => "000000"} 
			
			# pdf.text rec_set[0] + " ------ ------ ------ 0  ------" + " record Name", {:color => "000000"} 
			
			# pdf.text rec_set[1] + " ------ ------ ------ ------ ------ 1  ------" + " current date ", {:color => "ff0000"}
			# pdf.text rec_set[2] + " ------ ------ ------ ------ ------ ------ 2  ------" + " first name", {:color => "00ff00"} 
			# pdf.text rec_set[3] + " ------ ------ ------ ------ ------ ------ 3  ------" + " last name ", {:color => "0000ff"}

			# pdf.text rec_set[4] + " ------ ------ ------ ------ ------ 4  ------" + " Nick Name", {:color => "ff0000"}

			# pdf.text "\n"

			# pdf.text rec_set[5] + " ------ ------ ------  5  ------" + " city state combo", 									{:color => "00ff00"}
			
			# pdf.text "\n"
			# pdf.text "\n"

			# pdf.text rec_set[6].to_s + " ------ ------ ------ ------ 6  ------" + " note date", 								{:color => "000000"}
			# pdf.text rec_set[7] + " ------ ------ ------ ------ ------ 7  ------" + " total loan amount", 		{:color => "ff0000"}
			# pdf.text rec_set[8] + "  ------ ------ ------ ------ ------ 8  ------" + " finance fee", 				{:color => "00ff00"}
			# pdf.text rec_set[9] + " ------ ------ ------ ------ ------    9  ------" + " repay term months", 		{:color => "0000ff"}
			# pdf.text rec_set[10] + " ------ ------ ------ ------    10  ------" + " repay term month-th", 			{:color => "ff0000"}
			
			# pdf.text "\n"
			# pdf.text "\n"

			# pdf.text rec_set[11].to_s + " ------ ------ ------ ------ 11  ------" + " repay start", 							{:color => "ff0000"}
			# pdf.text rec_set[12].to_s + " ------ ------ ------ ------ 12  ------" + " repay 1st payment day", 				{:color => "00ff00"}
			# pdf.text rec_set[13].to_s + " ------ ------ ------ ------ 13  ------" + " repay mature date", 					{:color => "0000ff"}
			
			# pdf.text "\n"
			# pdf.text "\n"

			# pdf.text rec_set[14] + " ------ ------ ------ ------ ------ 14  ------" + " monthly payment ", 			{:color => "ff0000"}
			# pdf.text rec_set[15] + " ------ ------ ------ ------ ------ ------ 15  ------" + " Payment day ", 	{:color => "00ff00"}
			# pdf.text rec_set[16] + " ------ ------ ------ ------ ------  16  ------" + " Activation Fee", 			{:color => "0000ff"}
			# pdf.text rec_set[17] + " ------ ------ ------ ------ ------    17  ------" + " rate  ", 			{:color => "ff0000"}
			# pdf.text rec_set[18] + " ------ ------ ------ ------ ------ 18  ------" + " Monthly late fee", 			{:color => "00ff00"}
			# pdf.text rec_set[19] + " ------ ------ ------ ------ ------    19  ------" + " late payment", 			{:color => "0000ff"}


			# pdf.text "\n"
			# pdf.text "\n"

			# pdf.text rec_set[20].to_s + " ------ ------ ------ --- 20  ------" + " final date of loan", 					{:color => "ff0000"}
			# pdf.text rec_set[21] + " ------ ------ ------ - 21  ------" + " Backer 01", 							{:color => "00ff00"}
			# pdf.text rec_set[22] + " ------ ------ ------ ------ ------  22  ------" + " Backer 02", 				{:color => "0000ff"}
			# pdf.text rec_set[23] + " ------ ------ ------ ------ ------  23  ------" + " Backer 03", 				{:color => "ff0000"}


			# pdf.text "\n"
			# pdf.text "\n"

			# pdf.text rec_set[24] + " ------ ------ ------ ------ ------ --- 24 ------ ------ " + " commencement month  ", 			{:color => "ff0000"}
			# pdf.text rec_set[25] + " ------ ------ ------ ------ ------ ------ 25 ------ ------ " + " commencement year ", 	{:color => "00ff00"}
			# pdf.text rec_set[26] + " ------ ------ ------ ------ ------ ------ 26 ------ ------ " + " total deduction ", 			{:color => "0000ff"}
			# pdf.text rec_set[27].to_s + " ------ ------ ------ ------ ---- 27 ------ ------ " + " R300 date ", 			{:color => "ff0000"}
			# pdf.text rec_set[28] + " ------ ------ ------ ------ ------ --- 28 ------ ------ " + " Agent Number", 			{:color => "00ff00"}
			# pdf.text rec_set[29] + " ------ ------ ------ ---- 29 ------ ------ " + " email", 			{:color => "0000ff"}
			# pdf.text rec_set[30] + " ------ ------ ------ ---- 30 ------ ------ " + " phone ", 			{:color => "ff0000"}
			# pdf.text rec_set[31] + " ------ ------ ------ ------ ------ --- 31 ------ ------ " + " term assignment", 			{:color => "00ff00"}
			# pdf.text rec_set[32] + " ------ ------ ------ ------ ------ - 32 ------ ------ " + " position", 			{:color => "0000ff"}
			# pdf.text records_array.pay_pen.to_s + " ------ ------ ------ ------ ------ - 33 ------ ------ " + " penality", 			{:color => "000000"}
			# pdf.text rec_set[34] + " ------ ------ ------ ------ ------ - 34 ------ ------ " + " prepay penality", 			{:color => "0000ff"}
					

			# pdf.text item_array[step]
			#, {:color => "00ff00"}
			# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
			end

			# page 02

			# Client info 2
			# pdf.bounding_box([  place_array[step][0], place_array[step][1] ], :width => 430, :height => 16) do
			# 	pdf.text records_array.loan_name , {:color => "000000"}
			# 	# get_page_loc(step, place_array, pdf, var_x, var_y);
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )

			# end
			# step = up_one(step)  

			# # info 3
			# pdf.bounding_box([ place_array[step][0], place_array[step][1] ], :width => 430, :height => 16) do
			# # 	pdf.text full_name_show , {:color => "000000"}
			# 	pdf.text records_array.client_first_name , {:color => "000000"}
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
			# end

			# step = up_one(step)			
			# # #Address 4
			# pdf.bounding_box([ place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
	
			# 	pdf.text comp_address + " \n" + comp_address_state
			# 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			# end

			# step = up_one(step)
			# # # #intro 5
			# pdf.bounding_box([ place_array[step][0], place_array[step][1]], :width => 430, :height => 16) do
			# 	pdf.text intro
			# # 	get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			# end
			# step = up_one(step)
			# # #para 01 6
			# pdf.bounding_box([ place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
			# 	pdf.text para_A
			# # 	# pdf.text item_array[5]
			# # 	pdf.text para_A 
			# # 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			# end
			# # # text item_array[step]
			# # # end
			# step = up_one(step)
			# # #para 02 7
			# pdf.bounding_box([ place_array[step][0], place_array[step][1] ], :width => 430, :height => 40) do
			# 	# pdf.text item_array[step]
			# 	pdf.text para_B
			# # 	get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			
			# end
			# step = up_one(step) 
			# # #para 03 8
			# pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
			# 	pdf.text item_array[step]
			# # 	get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			# end
			# step = up_one(step)
			# # # #ender 9
			# pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
			# 	pdf.text item_array[step]
			# # 	get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			# end
			# step = up_one(step)
			# # # #sign to 10
			# pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
			# 	# pdf.text item_array[step]
			# 	pdf.text sign_to
			# # 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			# end
			# step = up_one(step)
			# # #sign from 11
			# pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
			# 	pdf.text item_array[step]
			# # 	# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			# end
		end

		def page_letter_13(pdf,item_array,place_array,records_array, rec_set)
		    Prawn::Document.generate("point_funding_doc.pdf") do 
		        
				pdf.bounding_box([-30, 720], :width => 100, :height => 100, :at => [200, 550]) do
				    pdf.fill_color "000000"
					pdf.transparent(1.0, 0.2) do 
						pdf.image open("app/assets/images/logo_page.png"), :fit => [600, 1000], :at => [0, 160]
					end
				   pdf.fill_color "000000"
				end
				# page sign lines
				pdf.bounding_box([0, 90],{ :width => 100, :height => 100 }) do
					pdf.rectangle [110, 190], 180, 2
					pdf.fill_rectangle [10, 100],0, 0
					# pdf.fill_color "ff0000"
					pdf.rectangle [310, 190], 180, 2
					pdf.fill_rectangle [10, 100],0, 0
					# pdf.fill_rectangle [240, 510],0, 0
				end

				def up_one(step)
					step = step + 1
					return step	
				end

				def number_to_currency(num)
				  "$#{num.to_s.gsub(/\d(?=(...)+$)/, '\0,')}"
				end

				current_date = records_array.client_first_name.to_s
				my_string = item_array[0].to_s
				groupName = Time.new
				groupName = groupName.localtime.strftime('%b %d, %Y')
				say_date = my_string.gsub('#{current_date}', groupName )

				full_name = records_array.client_first_name + " " + records_array.client_last_name

				head_name = full_name
				full_name_show = head_name.gsub('#{full_name}', head_name )

				comp_address =  records_array.address_street;
				comp_address_state = records_array.address_city + ", " + records_array.address_state + " " + records_array.address_zip;

				intro = item_array[4]
				intro = intro.gsub('#{full_name}', full_name )
				intro = intro.gsub('#{nick_name}', rec_set[4].to_s )

				para_A = item_array[5].to_s 
				para_A = para_A.sub('#{full_name}', full_name )
				para_A = para_A.sub('(A1234)', rec_set[28] )
				# wash para B
				para_B = item_array[6].to_s
				# find vars and replace 
				para_B = para_B.sub('#{loan_rate}', records_array.stated_rate.to_s )
				para_B = para_B.sub('#{total_loan}', number_to_currency(records_array.total_amount) )
				st_date = records_array.repay_start.strftime("%B")
				para_B = para_B.sub('#{start_month}', st_date )	
				sign_to = item_array[9].to_s 
				sign_to = sign_to.sub('#{full_name}', full_name )


				tag_height = 14
				# step = up_one(step) 


				step = 0

				def get_page_loc(step, place_array, pdf, var_x, var_y)
					var_x = place_array[step][0]
					var_y = place_array[step][1]
						
					pdf.indent 320, 0 do
						pdf.stroke_color '000000'
						pdf.stroke_bounds
						pdf.text_box step.to_s + " - : " + place_array[step][0].to_s + " : w, " + place_array[step][1].to_s + " : h, ", {:size => 12, :color => "ff0000" }
						pdf.line_to [var_x, var_y]
					end
						# pdf.rectangle [var_x, var_y], 100, 200
					# end
				end
				# page layout 
				pdf.bounding_box([ place_array[step][0], place_array[step][1]],{ :width => 430, :height => 16}) do
					pdf.font "arial", size: 10 
					pdf.text say_date +" Page 13" + place_array.length.to_s , {:color => "000000"}
					get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
				end
				pdf.bounding_box([ place_array[step][0], place_array[step][1]],{ :width => 430, :height => 16}) do
					get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
				end
				step = up_one(step)

				# Client info 2
				pdf.bounding_box([  place_array[step][0], place_array[step][1] ], :width => 430, :height => 16) do
					pdf.text records_array.loan_name , {:color => "000000"}
						get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
				end
				step = up_one(step)  

				# info 3
				pdf.bounding_box([ place_array[step][0], place_array[step][1] ], :width => 430, :height => 16) do
				# 	pdf.text full_name_show , {:color => "000000"}
					pdf.text records_array.client_first_name , {:color => "000000"}
					# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
				end

				step = up_one(step)			
				# #Address 4
				pdf.bounding_box([ place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
					# pdf.font "arial", size: 10 
					pdf.text comp_address + " \n" + comp_address_state
					# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
				end

				step = up_one(step)
				# #intro 5
				pdf.bounding_box([ place_array[step][0], place_array[step][1]], :width => 430, :height => 16) do
					pdf.text intro
					# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
				end
				step = up_one(step)
				#para 01 6
				pdf.bounding_box([ place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
					# pdf.text item_array[step]
					# pdf.text item_array[5]
					pdf.text para_A 
					# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
				end
				# text item_array[step]
				# end
				step = up_one(step)
				#para 02 7
				pdf.bounding_box([ place_array[step][0], place_array[step][1] ], :width => 430, :height => 40) do
					
					pdf.text para_B
					# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )

				end
				step = up_one(step) 
				#para 03 8
				pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
					pdf.text item_array[step]
					# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
				end
				step = up_one(step)
				# #ender 9
				pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
					pdf.text item_array[step]
					# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
				end
				step = up_one(step)
				# #sign to 10
				pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
				# 	# pdf.text item_array[step]
					pdf.text sign_to
					# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
				end
				step = up_one(step)
				#sign from 11
				pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
					pdf.text item_array[step]
					# get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
				end
			end
		end

		# Contract 8 pic 
		def page_letter_11(pdf,item_array,place_array,records_array,rec_set)
			Prawn::Document.generate("point_funding_doc.pdf") do
			pdf.bounding_box([-40, 660], :width => 100, :height => 100, :at => [200, 550]) do
	            pdf.fill_color "000000"
				pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/page_files/con_8_page_1.png"), :fit => [600, 1000], :at => [0, 160]
				end
	           pdf.fill_color "000000"
	        end
	        # page sign lines
	        pdf.bounding_box([0, 90],{ :width => 100, :height => 100 }) do
				# pdf.rectangle [110, 190], 180, 2
				# pdf.fill_rectangle [10, 100],0, 0
				# # pdf.fill_color "ff0000"
				# pdf.rectangle [310, 190], 180, 2
				# pdf.fill_rectangle [10, 100],0, 0
				# pdf.fill_rectangle [240, 510],0, 0
	        end
		        
		        def up_one(step)
		        	step = step + 1
		        	return step	
		        end

			    def number_to_currency(num)
				  "$#{num.to_s.gsub(/\d(?=(...)+$)/, '\0,')}"
				end
			end



			#PAGE 02
			##########################################################################################
			pdf.start_new_page



			pdf.bounding_box([-20, 680], :width => 100, :height => 100, :at => [200, 550]) do
	            pdf.fill_color "000000"
				pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/page_files/con_8_page_2.png"), :fit => [600, 1000], :at => [0, 160]
				end
	           pdf.fill_color "000000"
	        end


			#PAGE 03
			##########################################################################################
			pdf.start_new_page


			pdf.bounding_box([-20, 680], :width => 100, :height => 100, :at => [200, 550]) do
	            pdf.fill_color "000000"
				pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/page_files/con_8_page_3.png"), :fit => [600, 1000], :at => [0, 160]
				end
	           pdf.fill_color "000000"
	        end


	        pdf.bounding_box([ 470, 730], :width => 430, :height => 30) do
				pdf.text rec_set[32] , :color => "ff0000", :size => 8 
			end
	        pdf.bounding_box([ 490, 714], :width => 430, :height => 30) do
				pdf.text rec_set[2][0] + ". " + rec_set[3][0] + ". ", :color => "ff0000", :size => 10 
			end

			


			pdf.bounding_box([ 100, 616], :width => 430, :height => 30) do
				pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			end
			pdf.bounding_box([ 44, 588], :width => 430, :height => 30) do
				pdf.text rec_set[28] , :color => "ff0000" 
			end
			pdf.bounding_box([ 160, 534], :width => 430, :height => 30) do
				pdf.text rec_set[0] , :color => "ff0000" 
			end

			
			# PAGE 04
			##########################################################################################
			pdf.start_new_page


			pdf.bounding_box([-20, 690], :width => 100, :height => 100, :at => [200, 550]) do
	            pdf.fill_color "000000"
				pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/page_files/con_8_page_4.png"), :fit => [580, 1000], :at => [0, 160]
				end
	           pdf.fill_color "000000"
	        end





			pdf.bounding_box([ 100, 434], :width => 430, :height => 30) do
				pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			end

			pdf.bounding_box([ 260, 374], :width => 430, :height => 30) do
				pdf.text rec_set[1].strftime('%b %d, %Y'), :color => "ff0000" 
			end


			pdf.bounding_box([ 100, 298], :width => 430, :height => 30) do
				pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			end

			pdf.bounding_box([ 260, 224], :width => 430, :height => 30) do
				pdf.text rec_set[1].strftime('%b %d, %Y'), :color => "ff0000" 
			end










	        # PAGE 05
			##########################################################################################
			pdf.start_new_page


			pdf.bounding_box([-10, 690], :width => 100, :height => 100, :at => [200, 550]) do
	            pdf.fill_color "000000"
				pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/page_files/con_8_page_5.png"), :fit => [560, 940], :at => [0, 160]
				end
	           pdf.fill_color "000000"
	        end


			pdf.bounding_box([ 144, 628], :width => 430, :height => 30) do
				pdf.text rec_set[6].strftime('%d'), :color => "ff0000" 
			end

			pdf.bounding_box([ 240, 628], :width => 430, :height => 30) do
				pdf.text rec_set[6].strftime('%B'), :color => "ff0000" 
			end

			pdf.bounding_box([ 340, 628], :width => 430, :height => 30) do
				pdf.text rec_set[6].strftime('%Y'), :color => "ff0000" 
			end

			pdf.bounding_box([ 200, 600], :width => 430, :height => 30) do
				pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			end

			pdf.bounding_box([ 200, 574], :width => 430, :height => 30) do
				pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			end

			pdf.bounding_box([ 40, 498], :width => 430, :height => 30) do
				pdf.text rec_set[28] , :color => "ff0000" 
			end



	        # PAGE 06
			##########################################################################################
			pdf.start_new_page


			pdf.bounding_box([-10, 670], :width => 100, :height => 100, :at => [200, 550]) do
	            pdf.fill_color "000000"
				pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/page_files/con_8_page_6.png"), :fit => [560, 940], :at => [0, 160]
				end
	           pdf.fill_color "000000"
	        end
			



			pdf.bounding_box([ 220, 622], :width => 430, :height => 30) do
				pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			end

			pdf.bounding_box([ 140, 592], :width => 430, :height => 30) do
				pdf.text records_array.address_street.to_s , :color => "ff0000" 
			end

			pdf.bounding_box([ 380, 592], :width => 430, :height => 30) do
				pdf.text records_array.address_state.to_s , :color => "ff0000" 
			end

			pdf.bounding_box([ 460, 592], :width => 430, :height => 30) do
				pdf.text records_array.address_zip.to_s , :color => "ff0000" 
			end

			pdf.bounding_box([ 140, 562], :width => 430, :height => 30) do
				pdf.text rec_set[29].to_s , :color => "ff0000" 
			end

			pdf.bounding_box([340, 562], :width => 430, :height => 30) do
				pdf.text rec_set[30].to_s , :color => "ff0000" 
			end


			# Agency form
			pdf.bounding_box([ 220, 528], :width => 430, :height => 30) do
				pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			end

			pdf.bounding_box([ 220, 482], :width => 430, :height => 30) do
				pdf.text "Agency Name", :color => "ff0000" 
			end


			pdf.bounding_box([ 140, 454], :width => 430, :height => 30) do
				pdf.text records_array.address_street.to_s , :color => "ff0000" 
			end

			pdf.bounding_box([ 380, 454], :width => 430, :height => 30) do
				pdf.text records_array.address_state.to_s , :color => "ff0000" 
			end

			pdf.bounding_box([ 460, 454], :width => 430, :height => 30) do
				pdf.text records_array.address_zip.to_s , :color => "ff0000" 
			end

			pdf.bounding_box([ 140, 418], :width => 430, :height => 30) do
				pdf.text rec_set[29].to_s , :color => "ff0000" 
			end

			pdf.bounding_box([340, 418], :width => 430, :height => 30) do
				pdf.text rec_set[30].to_s , :color => "ff0000" 
			end
















			#PAGE 07  
			##########################################################################################
			pdf.start_new_page


			pdf.bounding_box([0, 670], :width => 100, :height => 100, :at => [200, 550]) do
	            pdf.fill_color "000000"
				pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/page_files/con_8_page_7.png"), :fit => [560, 940], :at => [0, 160]
				end
	           pdf.fill_color "000000"
	        end
			# Agency Accepted form

			pdf.bounding_box([ 440, 644], :width => 430, :height => 30) do
				pdf.text records_array.address_state.to_s , :color => "ff0000" 
			end
			pdf.bounding_box([ 60, 619], :width => 430, :height => 30) do
				pdf.text records_array.address_state.to_s , :color => "ff0000" 
			end
			pdf.bounding_box([ 130, 464], :width => 430, :height => 30) do
				pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			end
			pdf.bounding_box([ 130, 430], :width => 430, :height => 30) do
				pdf.text records_array.address_street.to_s , :color => "ff0000" 
			end
			pdf.bounding_box([ 130, 396], :width => 430, :height => 30) do
				pdf.text records_array.address_city.to_s , :color => "ff0000" 
			end
			pdf.bounding_box([ 240, 396], :width => 430, :height => 30) do
				pdf.text records_array.address_state.to_s , :color => "ff0000" 
			end
			pdf.bounding_box([ 310, 396], :width => 430, :height => 30) do
				pdf.text records_array.address_zip.to_s , :color => "ff0000" 
			end


			# Lender Accepted form
			pdf.bounding_box([ 130, 302], :width => 430, :height => 30) do
				pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			end
			pdf.bounding_box([ 130, 270], :width => 430, :height => 30) do
				pdf.text records_array.address_street.to_s , :color => "ff0000" 
			end
			pdf.bounding_box([ 130, 240], :width => 430, :height => 30) do
				pdf.text records_array.address_city.to_s , :color => "ff0000" 
			end
			pdf.bounding_box([ 240, 240], :width => 430, :height => 30) do
				pdf.text records_array.address_state.to_s , :color => "ff0000" 
			end
			pdf.bounding_box([ 310, 240], :width => 430, :height => 30) do
				pdf.text records_array.address_zip.to_s , :color => "ff0000" 
			end


			pdf.bounding_box([ 280, 196], :width => 430, :height => 30) do
				pdf.text rec_set[1].strftime('%b %d, %Y'), :color => "ff0000" 
			end





			pdf.bounding_box([ 180, 104], :width => 430, :height => 30) do
				pdf.text rec_set[32].to_s, :color => "ff0000" 
			end

			pdf.bounding_box([ 180, 74], :width => 430, :height => 30) do
				pdf.text rec_set[1].strftime('%b %d, %Y'), :color => "ff0000" 
			end




	        # PAGE 08
			##########################################################################################
			pdf.start_new_page


			pdf.bounding_box([-10, 690], :width => 100, :height => 100, :at => [200, 550]) do
	            pdf.fill_color "000000"
				pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/page_files/con_8_page_8.png"), :fit => [580, 940], :at => [0, 160]
				end
	           pdf.fill_color "000000"
	        end


			pdf.bounding_box([ 250, 649], :width => 430, :height => 30) do
				pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			end
			pdf.bounding_box([ 260, 622], :width => 430, :height => 30) do
				pdf.text rec_set[28], :color => "ff0000" 
			end



			pdf.bounding_box([ 26, 432], :width => 430, :height => 30) do
				pdf.text "X", :color => "ff0000", :size => 20 
			end
			pdf.bounding_box([ 166, 432], :width => 430, :height => 30) do
				pdf.text "X", :color => "ff0000", :size => 20 
			end



			pdf.bounding_box([ 80, 166], :width => 430, :height => 30) do
				pdf.text rec_set[1].strftime('%b %d, %Y'), :color => "ff0000" 
			end
			pdf.bounding_box([ 160, 214], :width => 430, :height => 30) do
				pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			end



			pdf.bounding_box([ 260, 68], :width => 430, :height => 30) do
				pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			end
			pdf.bounding_box([ 80, 16], :width => 430, :height => 30) do
				pdf.text rec_set[1].strftime('%b %d, %Y'), :color => "ff0000" 
			end



			# PAGE 09
			##########################################################################################
			pdf.start_new_page

			pdf.bounding_box([-30, 690], :width => 100, :height => 100, :at => [200, 550]) do
	            pdf.fill_color "000000"
				pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/page_files/con_8_page_9.png"), :fit => [600, 1000], :at => [0, 160]
				end
	           pdf.fill_color "000000"
	        end

	        # PAGE 10
			# ##########################################################################################
			pdf.start_new_page

			pdf.bounding_box([-10, 690], :width => 100, :height => 100, :at => [200, 550]) do
	            pdf.fill_color "000000"
				pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/page_files/con_8_page_10.png"), :fit => [570, 960], :at => [0, 160]
				end
	           pdf.fill_color "000000"
	        end


			##########################################################################################
			# pdf.start_new_page
		end


		# Contract 9 pic 
		def page_letter_12(pdf,item_array,place_array,records_array,rec_set)
			Prawn::Document.generate("point_funding_doc.pdf") do
				pdf.bounding_box([-10, 700], :width => 100, :height => 100, :at => [200, 550]) do
	            pdf.fill_color "000000"
					pdf.transparent(1.0, 0.2) do 
						pdf.image open("app/assets/page_files/con_9_page_1.png"), :fit => [550, 970], :at => [0, 160]
					end
	           pdf.fill_color "000000"
	        end
	        # page sign lines
	        pdf.bounding_box([0, 90],{ :width => 100, :height => 100 }) do
				# pdf.fill_color "ff0000"
				# pdf.rectangle [0, 600], 2, 600
				# pdf.fill_rectangle [10, 100],0, 0

				# pdf.rectangle [530, 600], 2, 600
				# pdf.fill_rectangle [10, 100],0, 0
				# pdf.fill_color "000000"
	        end
		        
		        def up_one(step)
		        	step = step + 1
		        	return step	
		        end

			    def number_to_currency(num)
				  "$#{num.to_s.gsub(/\d(?=(...)+$)/, '\0,')}"
				end
			end



			# page 02
			##########################################################################################
			pdf.start_new_page



			pdf.bounding_box([-50, 710], :width => 100, :height => 100, :at => [200, 550]) do
			          pdf.fill_color "000000"
				pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/page_files/con_9_page_2.png"), :fit => [600, 1000], :at => [0, 160]
				end
			         pdf.fill_color "000000"
			end

			pdf.bounding_box([0, 90],{ :width => 100, :height => 100 }) do
				pdf.fill_color "ff0000"
				pdf.rectangle [0, 600], 2, 600
				pdf.fill_rectangle [10, 100],0, 0

				pdf.rectangle [530, 600], 2, 600
				pdf.fill_rectangle [10, 100],0, 0
				pdf.fill_color "000000"
			end

	        # page 03
			#########################################################################################
			pdf.start_new_page

			pdf.bounding_box([0, 670], :width => 100, :height => 100, :at => [200, 550]) do
			          pdf.fill_color "000000"
				pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/page_files/con_9_page_3.png"), :fit => [570, 960], :at => [0, 160]
				end
			         pdf.fill_color "000000"
			end

			# HEADER FORM 
			pdf.bounding_box([ 420, 692], :width => 430, :height => 30) do
				pdf.text rec_set[24].to_s , :color => "ff0000", :size => 10 
			end

			pdf.bounding_box([ 490, 692], :width => 430, :height => 30) do
				pdf.text rec_set[25].to_s , :color => "ff0000", :size => 10 
			end


			# TOP FORM 
			pdf.bounding_box([ 180, 636], :width => 430, :height => 30) do
				pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			end
			pdf.bounding_box([ 94, 606], :width => 430, :height => 30) do
				pdf.text rec_set[28] , :color => "ff0000" 
			end
			pdf.bounding_box([ 250, 590], :width => 430, :height => 30) do
				pdf.text  "$ " + rec_set[26].to_s , :color => "ff0000" 
			end

			pdf.bounding_box([ 210, 570], :width => 430, :height => 30) do
				pdf.text "$ " + rec_set[8].to_s , :color => "ff0000" 
			end
			pdf.bounding_box([ 50, 39], :width => 430, :height => 30) do
				pdf.text rec_set[1].strftime('%b %d, %Y'), :color => "ff0000" 
			end
			pdf.bounding_box([ 340, 39], :width => 430, :height => 30) do
				pdf.text rec_set[1].strftime('%b %d, %Y'), :color => "ff0000" 
			end

			#      pdf.bounding_box([0, 90],{ :width => 100, :height => 100 }) do
					# pdf.fill_color "ff0000"
					# pdf.rectangle [0, 600], 2, 600
					# pdf.fill_rectangle [10, 100],0, 0

					# pdf.rectangle [530, 600], 2, 600
					# pdf.fill_rectangle [10, 100],0, 0
					# pdf.fill_color "000000"
			#      end



			# page 04
			##########################################################################################
			pdf.start_new_page


			pdf.bounding_box([-40, 730], :width => 100, :height => 100, :at => [200, 550]) do
			          pdf.fill_color "000000"
				pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/page_files/con_9_page_4.png"), :fit => [590, 990], :at => [0, 160]
				end
			         pdf.fill_color "000000"
		    end

			pdf.bounding_box([ 390, 676], :width => 430, :height => 30) do
				pdf.text rec_set[1].strftime('%b %d, %Y'), :color => "ff0000" 
			end
			pdf.bounding_box([ 250, 656], :width => 430, :height => 30) do
				pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			end
			pdf.bounding_box([ 200, 636], :width => 430, :height => 30) do
				pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			end
			pdf.bounding_box([ 410, 536], :width => 430, :height => 30) do
				pdf.text rec_set[27].to_s, :color => "ff0000" 
			end			
			#      pdf.bounding_box([0, 90],{ :width => 100, :height => 100 }) do
					# pdf.fill_color "ff0000"
					# pdf.rectangle [0, 600], 2, 600
					# pdf.fill_rectangle [10, 100],0, 0

					# pdf.rectangle [530, 600], 2, 600
					# pdf.fill_rectangle [10, 100],0, 0
					# pdf.fill_color "000000"
			#      end

		    # page 05
			# ##########################################################################################
			pdf.start_new_page


			pdf.bounding_box([-40, 680], :width => 100, :height => 100, :at => [200, 550]) do
			          pdf.fill_color "000000"
				pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/page_files/con_9_page_5.png"), :fit => [600, 1000], :at => [0, 160]
				end
			         pdf.fill_color "000000"
			end
	        
			#      pdf.bounding_box([0, 90],{ :width => 100, :height => 100 }) do
					# pdf.fill_color "ff0000"
					# pdf.rectangle [0, 600], 2, 600
					# pdf.fill_rectangle [10, 100],0, 0

					# pdf.rectangle [530, 600], 2, 600
					# pdf.fill_rectangle [10, 100],0, 0
					# pdf.fill_color "000000"
			#      end

			#  # page 06
			# # ##########################################################################################
			pdf.start_new_page


			pdf.bounding_box([-40, 700], :width => 100, :height => 100, :at => [200, 550]) do
			          pdf.fill_color "000000"
				pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/page_files/con_9_page_6.png"), :fit => [600, 1000], :at => [0, 160]
				end
			         pdf.fill_color "000000"
			end
	        
			#      pdf.bounding_box([0, 90],{ :width => 100, :height => 100 }) do
					# pdf.fill_color "ff0000"
					# pdf.rectangle [0, 600], 2, 600
					# pdf.fill_rectangle [10, 100],0, 0

					# pdf.rectangle [530, 600], 2, 600
					# pdf.fill_rectangle [10, 100],0, 0
					# pdf.fill_color "000000"
			#      end

			# # # page 07
			# # # ##########################################################################################
			pdf.start_new_page

			pdf.bounding_box([-40, 680], :width => 100, :height => 100, :at => [200, 550]) do
			          pdf.fill_color "000000"
				pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/page_files/con_9_page_7.png"), :fit => [580, 990], :at => [0, 160]
				end
			         pdf.fill_color "000000"
			end



			pdf.bounding_box([ 130, 256], :width => 430, :height => 30) do
				pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			end

			pdf.bounding_box([ 100, 220], :width => 430, :height => 30) do
				pdf.text records_array.address_street.to_s , :color => "ff0000" 
			end

			pdf.bounding_box([ 320, 220], :width => 430, :height => 30) do
				pdf.text records_array.address_city.to_s , :color => "ff0000" 
			end

			pdf.bounding_box([ 420, 220], :width => 430, :height => 30) do
				pdf.text records_array.address_state.to_s , :color => "ff0000" 
			end

			pdf.bounding_box([ 470, 220], :width => 430, :height => 30) do
				pdf.text records_array.address_zip.to_s , :color => "ff0000" 
			end

			pdf.bounding_box([ 140, 186], :width => 430, :height => 30) do
				pdf.text rec_set[29].to_s , :color => "ff0000" 
			end

			pdf.bounding_box([340, 186], :width => 430, :height => 30) do
				pdf.text rec_set[30].to_s , :color => "ff0000" 
			end

			pdf.bounding_box([ 130, 132], :width => 430, :height => 30) do
				pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			end

			pdf.bounding_box([ 100, 98], :width => 430, :height => 30) do
				pdf.text records_array.address_street.to_s , :color => "ff0000" 
			end

			pdf.bounding_box([ 320, 98], :width => 430, :height => 30) do
				pdf.text records_array.address_city.to_s , :color => "ff0000" 
			end

			pdf.bounding_box([ 420, 98], :width => 430, :height => 30) do
				pdf.text records_array.address_state.to_s , :color => "ff0000" 
			end

			pdf.bounding_box([ 470, 98], :width => 430, :height => 30) do
				pdf.text records_array.address_zip.to_s , :color => "ff0000" 
			end


			pdf.bounding_box([ 140, 64], :width => 430, :height => 30) do
				pdf.text rec_set[29].to_s , :color => "ff0000" 
			end

			pdf.bounding_box([340, 64], :width => 430, :height => 30) do
				pdf.text rec_set[30].to_s , :color => "ff0000" 
			end

	

			# # page 08
			# # ##########################################################################################
			pdf.start_new_page


			pdf.bounding_box([0, 700], :width => 100, :height => 100, :at => [200, 550]) do
			          pdf.fill_color "000000"
				pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/page_files/con_9_page_8.png"), :fit => [570, 980], :at => [0, 160]
				end
			         pdf.fill_color "000000"
			end


	  		#       # TOP FORM 
			pdf.bounding_box([ 130, 558], :width => 430, :height => 30) do
				pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			end
			pdf.bounding_box([ 120, 528], :width => 430, :height => 30) do
				pdf.text records_array.address_street.to_s , :color => "ff0000" 
			end
			pdf.bounding_box([ 110, 494], :width => 430, :height => 30) do
				pdf.text records_array.address_city.to_s , :color => "ff0000" 
			end
			pdf.bounding_box([ 176, 494], :width => 430, :height => 30) do
				pdf.text records_array.address_state.to_s , :color => "ff0000" 
			end
			pdf.bounding_box([ 240, 494], :width => 430, :height => 30) do
				pdf.text records_array.address_zip.to_s , :color => "ff0000" 
			end
			pdf.bounding_box([ 280, 452], :width => 430, :height => 30) do
				pdf.text rec_set[1].strftime('%b %d, %Y'), :color => "ff0000" 
			end


			# Lender FORM
			pdf.bounding_box([ 130, 390], :width => 430, :height => 30) do
				pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			end
			pdf.bounding_box([ 120, 360], :width => 430, :height => 30) do
				pdf.text records_array.address_street.to_s , :color => "ff0000" 
			end
			pdf.bounding_box([ 110, 330], :width => 430, :height => 30) do
				pdf.text records_array.address_city.to_s , :color => "ff0000" 
			end
			pdf.bounding_box([ 176, 330], :width => 430, :height => 30) do
				pdf.text records_array.address_state.to_s , :color => "ff0000" 
			end
			pdf.bounding_box([ 240, 330], :width => 430, :height => 30) do
				pdf.text records_array.address_zip.to_s , :color => "ff0000" 
			end
			pdf.bounding_box([ 280, 272], :width => 430, :height => 30) do
				pdf.text rec_set[1].strftime('%b %d, %Y'), :color => "ff0000" 
			end


			# pdf.bounding_box([ 380, 46], :width => 430, :height => 30) do
			# 	pdf.text rec_set[1].strftime('%b %d, %Y'), :color => "ff0000" 
			# end
			# pdf.bounding_box([ 380, 16], :width => 430, :height => 30) do
			# 	pdf.text rec_set[1].strftime('%b %d, %Y'), :color => "ff0000" 
			# end


			pdf.bounding_box([140, 166], :width => 430, :height => 30) do
				pdf.text rec_set[1].strftime('%b %d, %Y'), :color => "ff0000"
			end

			pdf.bounding_box([140, 196], :width => 430, :height => 30) do
				pdf.text "Title" , :color => "ff0000" 
			end


			# # # page 09
			# # # ##########################################################################################
			pdf.start_new_page

			# pdf.bounding_box([0, 680], :width => 100, :height => 100, :at => [200, 550]) do
			#           pdf.fill_color "000000"
			# 	pdf.transparent(1.0, 0.2) do 
			# 		pdf.image open("app/assets/page_files/con_9_page_9.png"), :fit => [540, 950], :at => [0, 160]
			# 	end
			#          pdf.fill_color "000000"
			# end

	  		#       # TOP FORM 
			# pdf.bounding_box([ 420, 646], :width => 430, :height => 30) do
			# 	pdf.text rec_set[28].to_s, :color => "ff0000" 
			# end

			# pdf.bounding_box([ 130, 628], :width => 430, :height => 30) do
			# 	pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			# end

			# pdf.bounding_box([ 120, 603], :width => 430, :height => 30) do
			# 	pdf.text records_array.address_street.to_s , :color => "ff0000" 
			# end

			# pdf.bounding_box([ 110, 580], :width => 430, :height => 30) do
			# 	pdf.text records_array.address_city.to_s , :color => "ff0000" 
			# end

			# pdf.bounding_box([ 270, 580], :width => 430, :height => 30) do
			# 	pdf.text records_array.address_state.to_s , :color => "ff0000" 
			# end

			# pdf.bounding_box([ 380, 580], :width => 430, :height => 30) do
			# 	pdf.text records_array.address_zip.to_s , :color => "ff0000" 
			# end
	
			# pdf.bounding_box([ 110, 562], :width => 430, :height => 30) do
			# 	pdf.text rec_set[30].to_s, :color => "ff0000" 
			# end

			# pdf.bounding_box([ 360, 562], :width => 430, :height => 30) do
			# 	pdf.text rec_set[29].to_s, :color => "ff0000" 
			# end


			# # Lender form
			# pdf.bounding_box([ 130, 490], :width => 430, :height => 30) do
			# 	pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			# end

			# pdf.bounding_box([ 120, 466], :width => 430, :height => 30) do
			# 	pdf.text records_array.address_street.to_s , :color => "ff0000" 
			# end

			# pdf.bounding_box([ 110, 424], :width => 430, :height => 30) do
			# 	pdf.text records_array.address_city.to_s , :color => "ff0000" 
			# end

			# pdf.bounding_box([ 270, 424], :width => 430, :height => 30) do
			# 	pdf.text records_array.address_state.to_s , :color => "ff0000" 
			# end

			# pdf.bounding_box([ 380, 424], :width => 430, :height => 30) do
			# 	pdf.text records_array.address_zip.to_s , :color => "ff0000" 
			# end

			# pdf.bounding_box([ 110, 402], :width => 430, :height => 30) do
			# 	pdf.text rec_set[30].to_s, :color => "ff0000" 
			# end
			# pdf.bounding_box([ 360, 402], :width => 430, :height => 30) do
			# 	pdf.text rec_set[29].to_s, :color => "ff0000" 
			# end



			# # Mid placement 
			# pdf.bounding_box([ 420, 344], :width => 430, :height => 30) do
			# 	pdf.text "$" + rec_set[26].to_s, :color => "ff0000" 
			# end
			# pdf.bounding_box([ 100, 292], :width => 430, :height => 30) do
			# 	pdf.text "$" + rec_set[7].to_s, :color => "ff0000" 
			# end


			# pdf.bounding_box([ 142, 540], :width => 430, :height => 30) do
			# 	pdf.text "X", :color => "ff0000", :size => 20 
			# end
			# pdf.bounding_box([ 316, 540], :width => 430, :height => 30) do
			# 	pdf.text "X", :color => "ff0000", :size => 20 
			# end



			# #BOTTOM FORM SIGN NAME DATE 
			# pdf.bounding_box([ 280, 72], :width => 430, :height => 30) do
			# 	pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			# end
			# pdf.bounding_box([ 400, 72], :width => 430, :height => 30) do
			# 	pdf.text rec_set[1].strftime('%b %d, %Y'), :color => "ff0000" 
			# end
			# pdf.bounding_box([ 400, 36], :width => 430, :height => 30) do
			# 	pdf.text rec_set[1].strftime('%b %d, %Y'), :color => "ff0000" 
			# end


			# # # # page 10
			# # # ##########################################################################################
			pdf.start_new_page


			# pdf.bounding_box([-30, 680], :width => 100, :height => 100, :at => [200, 550]) do
			#           pdf.fill_color "000000"
			# 	pdf.transparent(1.0, 0.2) do 
			# 		pdf.image open("app/assets/page_files/con_9_page_10.png"), :fit => [580, 980], :at => [0, 160]
			# 	end
			#          pdf.fill_color "000000"
			# end

			# pdf.bounding_box([ 130, 620], :width => 430, :height => 30) do
			# 	pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			# end
			# pdf.bounding_box([ 130, 598], :width => 430, :height => 30) do
			# 	pdf.text rec_set[28].to_s, :color => "ff0000" 
			# end


			# pdf.bounding_box([ 174, 550], :width => 430, :height => 30) do
			# 	pdf.text "X", :color => "ff0000", :size => 20 
			# end
			# pdf.bounding_box([ 348, 550], :width => 430, :height => 30) do
			# 	pdf.text "X", :color => "ff0000", :size => 20 
			# end


			# # pdf.bounding_box([ 420, 646], :width => 430, :height => 30) do
			# # 	pdf.text rec_set[28].to_s, :color => "ff0000" 
			# # end

			# pdf.bounding_box([ 204, 482], :width => 430, :height => 30) do
			# 	pdf.text "Bank Name", :color => "ff0000" 
			# end
			# pdf.bounding_box([ 200, 460], :width => 430, :height => 30) do
			# 	pdf.text  "Bank Routing", :color => "ff0000" 
			# end
			# pdf.bounding_box([ 110, 440], :width => 430, :height => 30) do
			# 	pdf.text  "Account Number", :color => "ff0000" 
			# end
			# pdf.bounding_box([ 330, 440], :width => 430, :height => 30) do
			# 	pdf.text "Loan Account Number", :color => "ff0000" 
			# end


			# pdf.bounding_box([ 122, 418], :width => 430, :height => 30) do
			# 	pdf.text "X", :color => "ff0000", :size => 20 
			# end
			# pdf.bounding_box([ 396, 418], :width => 430, :height => 30) do
			# 	pdf.text "X", :color => "ff0000", :size => 20 
			# end		


			# # Lender form
			# pdf.bounding_box([ 230, 320], :width => 430, :height => 30) do
			# 	pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			# end

			# pdf.bounding_box([ 120, 290], :width => 430, :height => 30) do
			# 	pdf.text records_array.address_street.to_s , :color => "ff0000" 
			# end

			# pdf.bounding_box([ 110, 264], :width => 430, :height => 30) do
			# 	pdf.text records_array.address_city.to_s , :color => "ff0000" 
			# end

			# pdf.bounding_box([ 290, 264], :width => 430, :height => 30) do
			# 	pdf.text records_array.address_state.to_s , :color => "ff0000" 
			# end

			# pdf.bounding_box([ 440, 264], :width => 530, :height => 30) do
			# 	pdf.text records_array.address_zip.to_s , :color => "ff0000" 
			# end

			# pdf.bounding_box([ 110, 240], :width => 430, :height => 30) do
			# 	pdf.text "Attn :", :color => "ff0000" 
			# end

			# pdf.bounding_box([ 360, 208], :width => 430, :height => 30) do
			# 	pdf.text "Memo ", :color => "ff0000" 
			# end

			# # Acknowledgement
			# pdf.bounding_box([ 360, 110], :width => 430, :height => 30) do
			# 	pdf.text "Lender ", :color => "ff0000" 
			# end

			# pdf.bounding_box([ 260, 210], :width => 430, :height => 30) do
			# 	# pdf.text "Lender ", :color => "ff0000" 
			# end

			# pdf.bounding_box([ 210, 58], :width => 430, :height => 30) do
			# 	pdf.text rec_set[1].strftime('%b %d, %Y'), :color => "ff0000" 
			# end


			# BANK NAME 


			# # page 11
			# ##########################################################################################
			pdf.start_new_page

    		# 	pdf.bounding_box([0, 90],{ :width => 600, :height => 100 }) do
				# pdf.fill_color "ff0000"
				# pdf.rectangle [0, 700], 600, 2
				# pdf.fill_rectangle [10, 100],0, 0
				
				# pdf.fill_color "00ff00"
				# pdf.rectangle [0, 600], 600, 2
				# pdf.fill_rectangle [10, 100],0, 0

				# pdf.fill_color "0000ff"
				# pdf.rectangle [0, 500], 600, 2
				# pdf.fill_rectangle [10, 100],0, 0

				# pdf.fill_color "ff0000"
				# pdf.rectangle [0, 400], 600, 2
				# pdf.fill_rectangle [10, 100],0, 0
				
				# pdf.fill_color "00ff00"
				# pdf.rectangle [0, 300], 600, 2
				# pdf.fill_rectangle [10, 100],0, 0

				# pdf.fill_color "0000ff"
				# pdf.rectangle [0, 200], 600, 2
				# pdf.fill_rectangle [10, 100],0, 0

				# pdf.fill_color "ff0000"
				# pdf.rectangle [0, 100], 600, 2
				# pdf.fill_rectangle [10, 100],0, 0
				
				# pdf.fill_color "00ff00"
				# pdf.rectangle [0, 0], 600, 2
				# pdf.fill_rectangle [10, 100],0, 0

				# pdf.fill_color "000000"
	   		#      end



			# pdf.bounding_box([-30, 690], :width => 100, :height => 100, :at => [200, 550]) do
			#           pdf.fill_color "000000"
			# 	pdf.transparent(1.0, 0.2) do 
			# 		pdf.image open("app/assets/page_files/con_9_page_11.png"), :fit => [580, 960], :at => [0, 160]
			# 	end
			#          pdf.fill_color "000000"
			# end

			# pdf.bounding_box([ 240, 636], :width => 430, :height => 30) do
			# 	pdf.text "Attn :", :color => "ff0000" 
			# end

			# pdf.bounding_box([ 240, 614], :width => 430, :height => 30) do
			# 	pdf.text "Attn :", :color => "ff0000" 
			# end


			# pdf.bounding_box([ 16, 536], :width => 430, :height => 30) do
			# 	pdf.text "X", :color => "ff0000", :size => 20 
			# end		
			# pdf.bounding_box([ 16, 514], :width => 430, :height => 30) do
			# 	pdf.text "X", :color => "ff0000", :size => 20 
			# end		
			# pdf.bounding_box([ 16, 490], :width => 430, :height => 30) do
			# 	pdf.text "X", :color => "ff0000", :size => 20 
			# end	




			# pdf.bounding_box([ 30, 434], :width => 430, :height => 30) do
			# 	pdf.text "X", :color => "ff0000", :size => 20 
			# end		
			# pdf.bounding_box([ 186, 434], :width => 430, :height => 30) do
			# 	pdf.text "X", :color => "ff0000", :size => 20 
			# end		
			# pdf.bounding_box([ 336, 434], :width => 430, :height => 30) do
			# 	pdf.text "X", :color => "ff0000", :size => 20 
			# end		



			# pdf.bounding_box([ 230, 222], :width => 430, :height => 30) do
			# 	pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			# end
			# pdf.bounding_box([ 250, 176], :width => 430, :height => 30) do
			# 	pdf.text rec_set[1].strftime('%b %d, %Y'), :color => "ff0000" 
			# end




			# pdf.bounding_box([ 230, 80], :width => 430, :height => 30) do
			# 	pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			# end
			# pdf.bounding_box([ 250, 34], :width => 430, :height => 30) do
			# 	pdf.text rec_set[1].strftime('%b %d, %Y'), :color => "ff0000" 
			# end




			# # # page 12
			# # # ##########################################################################################
			pdf.start_new_page

			# pdf.bounding_box([-30, 680], :width => 100, :height => 100, :at => [200, 550]) do
			#           pdf.fill_color "000000"
			# 	pdf.transparent(1.0, 0.2) do 
			# 		pdf.image open("app/assets/page_files/con_9_page_12.png"), :fit => [600, 1000], :at => [0, 160]
			# 	end
			#          pdf.fill_color "000000"
			# end


			# # # page 13
			# # # ##########################################################################################
			pdf.start_new_page


			# pdf.bounding_box([-10, 690], :width => 100, :height => 100, :at => [200, 550]) do
			#           pdf.fill_color "000000"
			# 	pdf.transparent(1.0, 0.2) do 
			# 		pdf.image open("app/assets/page_files/con_9_page_13.png"), :fit => [570, 960], :at => [0, 160]
			# 	end
			#          pdf.fill_color "000000"
			# end



			# ##########################################################################################













		end









					# Contract 8 pic 
		def page_letter_14(pdf,item_array,place_array,records_array,rec_set)
			Prawn::Document.generate("point_funding_doc.pdf") do
			pdf.bounding_box([-40, 660], :width => 100, :height => 100, :at => [200, 550]) do
	            pdf.fill_color "000000"
				pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/page_files/con_8_page_1.png"), :fit => [600, 1000], :at => [0, 160]
				end
	           pdf.fill_color "000000"
	        end
	        # page sign lines
	        pdf.bounding_box([0, 90],{ :width => 100, :height => 100 }) do
				# pdf.rectangle [110, 190], 180, 2
				# pdf.fill_rectangle [10, 100],0, 0
				# # pdf.fill_color "ff0000"
				# pdf.rectangle [310, 190], 180, 2
				# pdf.fill_rectangle [10, 100],0, 0
				# pdf.fill_rectangle [240, 510],0, 0
	        end
		        
		        def up_one(step)
		        	step = step + 1
		        	return step	
		        end

			    def number_to_currency(num)
				  "$#{num.to_s.gsub(/\d(?=(...)+$)/, '\0,')}"
				end
			end



			#PAGE 02
			##########################################################################################
			pdf.start_new_page



			pdf.bounding_box([-20, 680], :width => 100, :height => 100, :at => [200, 550]) do
	            pdf.fill_color "000000"
				pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/page_files/con_8_page_2.png"), :fit => [600, 1000], :at => [0, 160]
				end
	           pdf.fill_color "000000"
	        end


			#PAGE 03
			##########################################################################################
			pdf.start_new_page


			pdf.bounding_box([-20, 680], :width => 100, :height => 100, :at => [200, 550]) do
	            pdf.fill_color "000000"
				pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/page_files/con_8_page_3.png"), :fit => [600, 1000], :at => [0, 160]
				end
	           pdf.fill_color "000000"
	        end


	        pdf.bounding_box([ 470, 730], :width => 430, :height => 30) do
				pdf.text rec_set[32] , :color => "ff0000", :size => 8 
			end
	        pdf.bounding_box([ 490, 714], :width => 430, :height => 30) do
				pdf.text rec_set[2][0] + ". " + rec_set[3][0] + ". ", :color => "ff0000", :size => 10 
			end

			


			pdf.bounding_box([ 100, 616], :width => 430, :height => 30) do
				pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			end
			pdf.bounding_box([ 44, 588], :width => 430, :height => 30) do
				pdf.text rec_set[28] , :color => "ff0000" 
			end
			pdf.bounding_box([ 160, 534], :width => 430, :height => 30) do
				pdf.text rec_set[0] , :color => "ff0000" 
			end

			
			# PAGE 04
			##########################################################################################
			pdf.start_new_page


			# pdf.bounding_box([-20, 690], :width => 100, :height => 100, :at => [200, 550]) do
	  #           pdf.fill_color "000000"
			# 	pdf.transparent(1.0, 0.2) do 
			# 		pdf.image open("app/assets/page_files/con_8_page_4.png"), :fit => [580, 1000], :at => [0, 160]
			# 	end
	  #          pdf.fill_color "000000"
	  #       end





			# pdf.bounding_box([ 100, 434], :width => 430, :height => 30) do
			# 	pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			# end

			# pdf.bounding_box([ 260, 374], :width => 430, :height => 30) do
			# 	pdf.text rec_set[1].strftime('%b %d, %Y'), :color => "ff0000" 
			# end


			# pdf.bounding_box([ 100, 298], :width => 430, :height => 30) do
			# 	pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			# end

			# pdf.bounding_box([ 260, 224], :width => 430, :height => 30) do
			# 	pdf.text rec_set[1].strftime('%b %d, %Y'), :color => "ff0000" 
			# end










	  #       # PAGE 05
			# ##########################################################################################
			# pdf.start_new_page


			# pdf.bounding_box([-10, 690], :width => 100, :height => 100, :at => [200, 550]) do
	  #           pdf.fill_color "000000"
			# 	pdf.transparent(1.0, 0.2) do 
			# 		pdf.image open("app/assets/page_files/con_8_page_5.png"), :fit => [560, 940], :at => [0, 160]
			# 	end
	  #          pdf.fill_color "000000"
	  #       end


			# pdf.bounding_box([ 144, 628], :width => 430, :height => 30) do
			# 	pdf.text rec_set[6].strftime('%d'), :color => "ff0000" 
			# end

			# pdf.bounding_box([ 240, 628], :width => 430, :height => 30) do
			# 	pdf.text rec_set[6].strftime('%B'), :color => "ff0000" 
			# end

			# pdf.bounding_box([ 340, 628], :width => 430, :height => 30) do
			# 	pdf.text rec_set[6].strftime('%Y'), :color => "ff0000" 
			# end

			# pdf.bounding_box([ 200, 600], :width => 430, :height => 30) do
			# 	pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			# end

			# pdf.bounding_box([ 200, 574], :width => 430, :height => 30) do
			# 	pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			# end

			# pdf.bounding_box([ 40, 498], :width => 430, :height => 30) do
			# 	pdf.text rec_set[28] , :color => "ff0000" 
			# end



	  #       # PAGE 06
			# ##########################################################################################
			# pdf.start_new_page


			# pdf.bounding_box([-10, 670], :width => 100, :height => 100, :at => [200, 550]) do
	  #           pdf.fill_color "000000"
			# 	pdf.transparent(1.0, 0.2) do 
			# 		pdf.image open("app/assets/page_files/con_8_page_6.png"), :fit => [560, 940], :at => [0, 160]
			# 	end
	  #          pdf.fill_color "000000"
	  #       end
			



			# pdf.bounding_box([ 220, 622], :width => 430, :height => 30) do
			# 	pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			# end

			# pdf.bounding_box([ 140, 592], :width => 430, :height => 30) do
			# 	pdf.text records_array.address_street.to_s , :color => "ff0000" 
			# end

			# pdf.bounding_box([ 380, 592], :width => 430, :height => 30) do
			# 	pdf.text records_array.address_state.to_s , :color => "ff0000" 
			# end

			# pdf.bounding_box([ 460, 592], :width => 430, :height => 30) do
			# 	pdf.text records_array.address_zip.to_s , :color => "ff0000" 
			# end

			# pdf.bounding_box([ 140, 562], :width => 430, :height => 30) do
			# 	pdf.text rec_set[29].to_s , :color => "ff0000" 
			# end

			# pdf.bounding_box([340, 562], :width => 430, :height => 30) do
			# 	pdf.text rec_set[30].to_s , :color => "ff0000" 
			# end


			# # Agency form
			# pdf.bounding_box([ 220, 528], :width => 430, :height => 30) do
			# 	pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			# end

			# pdf.bounding_box([ 220, 482], :width => 430, :height => 30) do
			# 	pdf.text "Agency Name", :color => "ff0000" 
			# end


			# pdf.bounding_box([ 140, 454], :width => 430, :height => 30) do
			# 	pdf.text records_array.address_street.to_s , :color => "ff0000" 
			# end

			# pdf.bounding_box([ 380, 454], :width => 430, :height => 30) do
			# 	pdf.text records_array.address_state.to_s , :color => "ff0000" 
			# end

			# pdf.bounding_box([ 460, 454], :width => 430, :height => 30) do
			# 	pdf.text records_array.address_zip.to_s , :color => "ff0000" 
			# end

			# pdf.bounding_box([ 140, 418], :width => 430, :height => 30) do
			# 	pdf.text rec_set[29].to_s , :color => "ff0000" 
			# end

			# pdf.bounding_box([340, 418], :width => 430, :height => 30) do
			# 	pdf.text rec_set[30].to_s , :color => "ff0000" 
			# end
















			# #PAGE 07  
			# ##########################################################################################
			# pdf.start_new_page


			# pdf.bounding_box([0, 670], :width => 100, :height => 100, :at => [200, 550]) do
	  #           pdf.fill_color "000000"
			# 	pdf.transparent(1.0, 0.2) do 
			# 		pdf.image open("app/assets/page_files/con_8_page_7.png"), :fit => [560, 940], :at => [0, 160]
			# 	end
	  #          pdf.fill_color "000000"
	  #       end
			# # Agency Accepted form

			# pdf.bounding_box([ 440, 644], :width => 430, :height => 30) do
			# 	pdf.text records_array.address_state.to_s , :color => "ff0000" 
			# end
			# pdf.bounding_box([ 60, 619], :width => 430, :height => 30) do
			# 	pdf.text records_array.address_state.to_s , :color => "ff0000" 
			# end
			# pdf.bounding_box([ 130, 464], :width => 430, :height => 30) do
			# 	pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			# end
			# pdf.bounding_box([ 130, 430], :width => 430, :height => 30) do
			# 	pdf.text records_array.address_street.to_s , :color => "ff0000" 
			# end
			# pdf.bounding_box([ 130, 396], :width => 430, :height => 30) do
			# 	pdf.text records_array.address_city.to_s , :color => "ff0000" 
			# end
			# pdf.bounding_box([ 240, 396], :width => 430, :height => 30) do
			# 	pdf.text records_array.address_state.to_s , :color => "ff0000" 
			# end
			# pdf.bounding_box([ 310, 396], :width => 430, :height => 30) do
			# 	pdf.text records_array.address_zip.to_s , :color => "ff0000" 
			# end


			# # Lender Accepted form
			# pdf.bounding_box([ 130, 302], :width => 430, :height => 30) do
			# 	pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			# end
			# pdf.bounding_box([ 130, 270], :width => 430, :height => 30) do
			# 	pdf.text records_array.address_street.to_s , :color => "ff0000" 
			# end
			# pdf.bounding_box([ 130, 240], :width => 430, :height => 30) do
			# 	pdf.text records_array.address_city.to_s , :color => "ff0000" 
			# end
			# pdf.bounding_box([ 240, 240], :width => 430, :height => 30) do
			# 	pdf.text records_array.address_state.to_s , :color => "ff0000" 
			# end
			# pdf.bounding_box([ 310, 240], :width => 430, :height => 30) do
			# 	pdf.text records_array.address_zip.to_s , :color => "ff0000" 
			# end


			# pdf.bounding_box([ 280, 196], :width => 430, :height => 30) do
			# 	pdf.text rec_set[1].strftime('%b %d, %Y'), :color => "ff0000" 
			# end





			# pdf.bounding_box([ 180, 104], :width => 430, :height => 30) do
			# 	pdf.text rec_set[32].to_s, :color => "ff0000" 
			# end

			# pdf.bounding_box([ 180, 74], :width => 430, :height => 30) do
			# 	pdf.text rec_set[1].strftime('%b %d, %Y'), :color => "ff0000" 
			# end




	  #       # PAGE 08
			# ##########################################################################################
			# pdf.start_new_page


			# pdf.bounding_box([-10, 690], :width => 100, :height => 100, :at => [200, 550]) do
	  #           pdf.fill_color "000000"
			# 	pdf.transparent(1.0, 0.2) do 
			# 		pdf.image open("app/assets/page_files/con_8_page_8.png"), :fit => [580, 940], :at => [0, 160]
			# 	end
	  #          pdf.fill_color "000000"
	  #       end


			# pdf.bounding_box([ 250, 649], :width => 430, :height => 30) do
			# 	pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			# end
			# pdf.bounding_box([ 260, 622], :width => 430, :height => 30) do
			# 	pdf.text rec_set[28], :color => "ff0000" 
			# end



			# pdf.bounding_box([ 26, 432], :width => 430, :height => 30) do
			# 	pdf.text "X", :color => "ff0000", :size => 20 
			# end
			# pdf.bounding_box([ 166, 432], :width => 430, :height => 30) do
			# 	pdf.text "X", :color => "ff0000", :size => 20 
			# end



			# pdf.bounding_box([ 80, 166], :width => 430, :height => 30) do
			# 	pdf.text rec_set[1].strftime('%b %d, %Y'), :color => "ff0000" 
			# end
			# pdf.bounding_box([ 160, 214], :width => 430, :height => 30) do
			# 	pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			# end



			# pdf.bounding_box([ 260, 68], :width => 430, :height => 30) do
			# 	pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			# end
			# pdf.bounding_box([ 80, 16], :width => 430, :height => 30) do
			# 	pdf.text rec_set[1].strftime('%b %d, %Y'), :color => "ff0000" 
			# end



			# # PAGE 09
			# ##########################################################################################
			# pdf.start_new_page

			# pdf.bounding_box([-30, 690], :width => 100, :height => 100, :at => [200, 550]) do
	  #           pdf.fill_color "000000"
			# 	pdf.transparent(1.0, 0.2) do 
			# 		pdf.image open("app/assets/page_files/con_8_page_9.png"), :fit => [600, 1000], :at => [0, 160]
			# 	end
	  #          pdf.fill_color "000000"
	  #       end

	  #       # PAGE 10
			# # ##########################################################################################
			# pdf.start_new_page

			# pdf.bounding_box([-10, 690], :width => 100, :height => 100, :at => [200, 550]) do
	  #           pdf.fill_color "000000"
			# 	pdf.transparent(1.0, 0.2) do 
			# 		pdf.image open("app/assets/page_files/con_8_page_10.png"), :fit => [570, 960], :at => [0, 160]
			# 	end
	  #          pdf.fill_color "000000"
	  #       end


			##########################################################################################
			# pdf.start_new_page
		end








		def page_letter_15(pdf,item_array,place_array,records_array,rec_set)
			Prawn::Document.generate("point_funding_doc.pdf") do
				pdf.bounding_box([-10, 700], :width => 100, :height => 100, :at => [200, 550]) do
	            pdf.fill_color "000000"
					pdf.transparent(1.0, 0.2) do 
						pdf.image open("app/assets/page_files/con_9_page_1.png"), :fit => [550, 970], :at => [0, 160]
					end
	           pdf.fill_color "000000"
	        end
	        # page sign lines
	        pdf.bounding_box([0, 90],{ :width => 100, :height => 100 }) do
				# pdf.fill_color "ff0000"
				# pdf.rectangle [0, 600], 2, 600
				# pdf.fill_rectangle [10, 100],0, 0

				# pdf.rectangle [530, 600], 2, 600
				# pdf.fill_rectangle [10, 100],0, 0
				# pdf.fill_color "000000"
	        end
		        
		        def up_one(step)
		        	step = step + 1
		        	return step	
		        end

			    def number_to_currency(num)
				  "$#{num.to_s.gsub(/\d(?=(...)+$)/, '\0,')}"
				end
			end



			# page 02
			##########################################################################################
			pdf.start_new_page



			pdf.bounding_box([-50, 710], :width => 100, :height => 100, :at => [200, 550]) do
			          pdf.fill_color "000000"
				pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/page_files/con_9_page_2.png"), :fit => [600, 1000], :at => [0, 160]
				end
			         pdf.fill_color "000000"
			end

			pdf.bounding_box([0, 90],{ :width => 100, :height => 100 }) do
				# pdf.fill_color "ff0000"
				# pdf.rectangle [0, 600], 2, 600
				# pdf.fill_rectangle [10, 100],0, 0

				# pdf.rectangle [530, 600], 2, 600
				# pdf.fill_rectangle [10, 100],0, 0
				# pdf.fill_color "000000"
			end

	        # page 03
			#########################################################################################
			pdf.start_new_page

			pdf.bounding_box([0, 670], :width => 100, :height => 100, :at => [200, 550]) do
			          pdf.fill_color "000000"
				pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/page_files/con_9_page_3.png"), :fit => [570, 960], :at => [0, 160]
				end
			         pdf.fill_color "000000"
			end

			# HEADER FORM 
			pdf.bounding_box([ 420, 692], :width => 430, :height => 30) do
				pdf.text rec_set[24].to_s , :color => "ff0000", :size => 10 
			end

			pdf.bounding_box([ 490, 692], :width => 430, :height => 30) do
				pdf.text rec_set[25].to_s , :color => "ff0000", :size => 10 
			end


			# TOP FORM 
			pdf.bounding_box([ 180, 636], :width => 430, :height => 30) do
				pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			end
			pdf.bounding_box([ 94, 606], :width => 430, :height => 30) do
				pdf.text rec_set[28] , :color => "ff0000" 
			end
			pdf.bounding_box([ 250, 590], :width => 430, :height => 30) do
				pdf.text  "$ " + rec_set[26].to_s , :color => "ff0000" 
			end

			pdf.bounding_box([ 210, 570], :width => 430, :height => 30) do
				pdf.text "$ " + rec_set[8].to_s , :color => "ff0000" 
			end
			pdf.bounding_box([ 50, 39], :width => 430, :height => 30) do
				pdf.text rec_set[1].strftime('%b %d, %Y'), :color => "ff0000" 
			end
			pdf.bounding_box([ 340, 39], :width => 430, :height => 30) do
				pdf.text rec_set[1].strftime('%b %d, %Y'), :color => "ff0000" 
			end

			#      pdf.bounding_box([0, 90],{ :width => 100, :height => 100 }) do
					# pdf.fill_color "ff0000"
					# pdf.rectangle [0, 600], 2, 600
					# pdf.fill_rectangle [10, 100],0, 0

					# pdf.rectangle [530, 600], 2, 600
					# pdf.fill_rectangle [10, 100],0, 0
					# pdf.fill_color "000000"
			#      end



			# page 04
			##########################################################################################
			pdf.start_new_page


			pdf.bounding_box([-40, 730], :width => 100, :height => 100, :at => [200, 550]) do
			          pdf.fill_color "000000"
				pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/page_files/con_9_page_4.png"), :fit => [590, 990], :at => [0, 160]
				end
			         pdf.fill_color "000000"
		    end

			pdf.bounding_box([ 390, 676], :width => 430, :height => 30) do
				pdf.text rec_set[1].strftime('%b %d, %Y'), :color => "ff0000" 
			end
			pdf.bounding_box([ 250, 656], :width => 430, :height => 30) do
				pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			end
			pdf.bounding_box([ 200, 636], :width => 430, :height => 30) do
				pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			end
			pdf.bounding_box([ 410, 536], :width => 430, :height => 30) do
				pdf.text rec_set[27].to_s, :color => "ff0000" 
			end			
			#      pdf.bounding_box([0, 90],{ :width => 100, :height => 100 }) do
					# pdf.fill_color "ff0000"
					# pdf.rectangle [0, 600], 2, 600
					# pdf.fill_rectangle [10, 100],0, 0

					# pdf.rectangle [530, 600], 2, 600
					# pdf.fill_rectangle [10, 100],0, 0
					# pdf.fill_color "000000"
			#      end

		    # page 05
			# ##########################################################################################
			pdf.start_new_page


			pdf.bounding_box([-40, 680], :width => 100, :height => 100, :at => [200, 550]) do
			          pdf.fill_color "000000"
				pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/page_files/con_9_page_5.png"), :fit => [600, 1000], :at => [0, 160]
				end
			         pdf.fill_color "000000"
			end
	        
			#      pdf.bounding_box([0, 90],{ :width => 100, :height => 100 }) do
					# pdf.fill_color "ff0000"
					# pdf.rectangle [0, 600], 2, 600
					# pdf.fill_rectangle [10, 100],0, 0

					# pdf.rectangle [530, 600], 2, 600
					# pdf.fill_rectangle [10, 100],0, 0
					# pdf.fill_color "000000"
			#      end

			#  # page 06
			# # ##########################################################################################
			pdf.start_new_page


			pdf.bounding_box([-40, 700], :width => 100, :height => 100, :at => [200, 550]) do
			          pdf.fill_color "000000"
				pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/page_files/con_9_page_6.png"), :fit => [600, 1000], :at => [0, 160]
				end
			         pdf.fill_color "000000"
			end
	        
			#      pdf.bounding_box([0, 90],{ :width => 100, :height => 100 }) do
					# pdf.fill_color "ff0000"
					# pdf.rectangle [0, 600], 2, 600
					# pdf.fill_rectangle [10, 100],0, 0

					# pdf.rectangle [530, 600], 2, 600
					# pdf.fill_rectangle [10, 100],0, 0
					# pdf.fill_color "000000"
			#      end

			# # # page 07
			# # # ##########################################################################################
			pdf.start_new_page

			pdf.bounding_box([-40, 680], :width => 100, :height => 100, :at => [200, 550]) do
			          pdf.fill_color "000000"
				pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/page_files/con_9_page_7.png"), :fit => [580, 990], :at => [0, 160]
				end
			         pdf.fill_color "000000"
			end



			pdf.bounding_box([ 130, 256], :width => 430, :height => 30) do
				pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			end

			pdf.bounding_box([ 100, 220], :width => 430, :height => 30) do
				pdf.text records_array.address_street.to_s , :color => "ff0000" 
			end

			pdf.bounding_box([ 320, 220], :width => 430, :height => 30) do
				pdf.text records_array.address_city.to_s , :color => "ff0000" 
			end

			pdf.bounding_box([ 420, 220], :width => 430, :height => 30) do
				pdf.text records_array.address_state.to_s , :color => "ff0000" 
			end

			pdf.bounding_box([ 470, 220], :width => 430, :height => 30) do
				pdf.text records_array.address_zip.to_s , :color => "ff0000" 
			end

			pdf.bounding_box([ 140, 186], :width => 430, :height => 30) do
				pdf.text rec_set[29].to_s , :color => "ff0000" 
			end

			pdf.bounding_box([340, 186], :width => 430, :height => 30) do
				pdf.text rec_set[30].to_s , :color => "ff0000" 
			end

			pdf.bounding_box([ 130, 132], :width => 430, :height => 30) do
				pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			end

			pdf.bounding_box([ 100, 98], :width => 430, :height => 30) do
				pdf.text records_array.address_street.to_s , :color => "ff0000" 
			end

			pdf.bounding_box([ 320, 98], :width => 430, :height => 30) do
				pdf.text records_array.address_city.to_s , :color => "ff0000" 
			end

			pdf.bounding_box([ 420, 98], :width => 430, :height => 30) do
				pdf.text records_array.address_state.to_s , :color => "ff0000" 
			end

			pdf.bounding_box([ 470, 98], :width => 430, :height => 30) do
				pdf.text records_array.address_zip.to_s , :color => "ff0000" 
			end


			pdf.bounding_box([ 140, 64], :width => 430, :height => 30) do
				pdf.text rec_set[29].to_s , :color => "ff0000" 
			end

			pdf.bounding_box([340, 64], :width => 430, :height => 30) do
				pdf.text rec_set[30].to_s , :color => "ff0000" 
			end

	

			# # page 08
			# # ##########################################################################################
			pdf.start_new_page


			pdf.bounding_box([0, 700], :width => 100, :height => 100, :at => [200, 550]) do
			          pdf.fill_color "000000"
				pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/page_files/con_9_page_8.png"), :fit => [570, 980], :at => [0, 160]
				end
			         pdf.fill_color "000000"
			end


	  		#       # TOP FORM 
			pdf.bounding_box([ 130, 558], :width => 430, :height => 30) do
				pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			end
			pdf.bounding_box([ 120, 528], :width => 430, :height => 30) do
				pdf.text records_array.address_street.to_s , :color => "ff0000" 
			end
			pdf.bounding_box([ 110, 494], :width => 430, :height => 30) do
				pdf.text records_array.address_city.to_s , :color => "ff0000" 
			end
			pdf.bounding_box([ 176, 494], :width => 430, :height => 30) do
				pdf.text records_array.address_state.to_s , :color => "ff0000" 
			end
			pdf.bounding_box([ 240, 494], :width => 430, :height => 30) do
				pdf.text records_array.address_zip.to_s , :color => "ff0000" 
			end
			pdf.bounding_box([ 280, 452], :width => 430, :height => 30) do
				pdf.text rec_set[1].strftime('%b %d, %Y'), :color => "ff0000" 
			end


			# Lender FORM
			pdf.bounding_box([ 130, 390], :width => 430, :height => 30) do
				pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			end
			pdf.bounding_box([ 120, 360], :width => 430, :height => 30) do
				pdf.text records_array.address_street.to_s , :color => "ff0000" 
			end
			pdf.bounding_box([ 110, 330], :width => 430, :height => 30) do
				pdf.text records_array.address_city.to_s , :color => "ff0000" 
			end
			pdf.bounding_box([ 176, 330], :width => 430, :height => 30) do
				pdf.text records_array.address_state.to_s , :color => "ff0000" 
			end
			pdf.bounding_box([ 240, 330], :width => 430, :height => 30) do
				pdf.text records_array.address_zip.to_s , :color => "ff0000" 
			end
			pdf.bounding_box([ 280, 272], :width => 430, :height => 30) do
				pdf.text rec_set[1].strftime('%b %d, %Y'), :color => "ff0000" 
			end


			# pdf.bounding_box([ 380, 46], :width => 430, :height => 30) do
			# 	pdf.text rec_set[1].strftime('%b %d, %Y'), :color => "ff0000" 
			# end
			# pdf.bounding_box([ 380, 16], :width => 430, :height => 30) do
			# 	pdf.text rec_set[1].strftime('%b %d, %Y'), :color => "ff0000" 
			# end


			pdf.bounding_box([140, 166], :width => 430, :height => 30) do
				pdf.text rec_set[1].strftime('%b %d, %Y'), :color => "ff0000"
			end

			pdf.bounding_box([140, 196], :width => 430, :height => 30) do
				pdf.text "Title" , :color => "ff0000" 
			end


			# # # page 09
			# # # ##########################################################################################
			pdf.start_new_page

			pdf.bounding_box([0, 680], :width => 100, :height => 100, :at => [200, 550]) do
			          pdf.fill_color "000000"
				pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/page_files/con_9_page_9.png"), :fit => [540, 950], :at => [0, 160]
				end
			         pdf.fill_color "000000"
			end

	  		      # TOP FORM 
			pdf.bounding_box([ 420, 646], :width => 430, :height => 30) do
				pdf.text rec_set[28].to_s, :color => "ff0000" 
			end

			pdf.bounding_box([ 130, 628], :width => 430, :height => 30) do
				pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			end

			pdf.bounding_box([ 120, 603], :width => 430, :height => 30) do
				pdf.text records_array.address_street.to_s , :color => "ff0000" 
			end

			pdf.bounding_box([ 110, 580], :width => 430, :height => 30) do
				pdf.text records_array.address_city.to_s , :color => "ff0000" 
			end

			pdf.bounding_box([ 270, 580], :width => 430, :height => 30) do
				pdf.text records_array.address_state.to_s , :color => "ff0000" 
			end

			pdf.bounding_box([ 380, 580], :width => 430, :height => 30) do
				pdf.text records_array.address_zip.to_s , :color => "ff0000" 
			end
	
			pdf.bounding_box([ 110, 562], :width => 430, :height => 30) do
				pdf.text rec_set[30].to_s, :color => "ff0000" 
			end

			pdf.bounding_box([ 360, 562], :width => 430, :height => 30) do
				pdf.text rec_set[29].to_s, :color => "ff0000" 
			end


			# Lender form
			pdf.bounding_box([ 130, 490], :width => 430, :height => 30) do
				pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			end

			pdf.bounding_box([ 120, 466], :width => 430, :height => 30) do
				pdf.text records_array.address_street.to_s , :color => "ff0000" 
			end

			pdf.bounding_box([ 110, 424], :width => 430, :height => 30) do
				pdf.text records_array.address_city.to_s , :color => "ff0000" 
			end

			pdf.bounding_box([ 270, 424], :width => 430, :height => 30) do
				pdf.text records_array.address_state.to_s , :color => "ff0000" 
			end

			pdf.bounding_box([ 380, 424], :width => 430, :height => 30) do
				pdf.text records_array.address_zip.to_s , :color => "ff0000" 
			end

			pdf.bounding_box([ 110, 402], :width => 430, :height => 30) do
				pdf.text rec_set[30].to_s, :color => "ff0000" 
			end
			pdf.bounding_box([ 360, 402], :width => 430, :height => 30) do
				pdf.text rec_set[29].to_s, :color => "ff0000" 
			end



			# Mid placement 
			pdf.bounding_box([ 420, 344], :width => 430, :height => 30) do
				pdf.text "$" + rec_set[26].to_s, :color => "ff0000" 
			end
			pdf.bounding_box([ 100, 292], :width => 430, :height => 30) do
				pdf.text "$" + rec_set[7].to_s, :color => "ff0000" 
			end


			pdf.bounding_box([ 142, 540], :width => 430, :height => 30) do
				pdf.text "X", :color => "ff0000", :size => 20 
			end
			pdf.bounding_box([ 316, 540], :width => 430, :height => 30) do
				pdf.text "X", :color => "ff0000", :size => 20 
			end



			#BOTTOM FORM SIGN NAME DATE 
			pdf.bounding_box([ 280, 72], :width => 430, :height => 30) do
				pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			end
			pdf.bounding_box([ 400, 72], :width => 430, :height => 30) do
				pdf.text rec_set[1].strftime('%b %d, %Y'), :color => "ff0000" 
			end
			pdf.bounding_box([ 400, 36], :width => 430, :height => 30) do
				pdf.text rec_set[1].strftime('%b %d, %Y'), :color => "ff0000" 
			end


			# # # # page 10
			# # # ##########################################################################################
			pdf.start_new_page


			# pdf.bounding_box([-30, 680], :width => 100, :height => 100, :at => [200, 550]) do
			#           pdf.fill_color "000000"
			# 	pdf.transparent(1.0, 0.2) do 
			# 		pdf.image open("app/assets/page_files/con_9_page_10.png"), :fit => [580, 980], :at => [0, 160]
			# 	end
			#          pdf.fill_color "000000"
			# end

			pdf.bounding_box([ 130, 620], :width => 430, :height => 30) do
				pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			end
			pdf.bounding_box([ 130, 598], :width => 430, :height => 30) do
				pdf.text rec_set[28].to_s, :color => "ff0000" 
			end


			pdf.bounding_box([ 174, 550], :width => 430, :height => 30) do
				pdf.text "X", :color => "ff0000", :size => 20 
			end
			pdf.bounding_box([ 348, 550], :width => 430, :height => 30) do
				pdf.text "X", :color => "ff0000", :size => 20 
			end


			# pdf.bounding_box([ 420, 646], :width => 430, :height => 30) do
			# 	pdf.text rec_set[28].to_s, :color => "ff0000" 
			# end

			pdf.bounding_box([ 204, 482], :width => 430, :height => 30) do
				pdf.text "Bank Name", :color => "ff0000" 
			end
			pdf.bounding_box([ 200, 460], :width => 430, :height => 30) do
				pdf.text  "Bank Routing", :color => "ff0000" 
			end
			pdf.bounding_box([ 110, 440], :width => 430, :height => 30) do
				pdf.text  "Account Number", :color => "ff0000" 
			end
			pdf.bounding_box([ 330, 440], :width => 430, :height => 30) do
				pdf.text "Loan Account Number", :color => "ff0000" 
			end


			pdf.bounding_box([ 122, 418], :width => 430, :height => 30) do
				pdf.text "X", :color => "ff0000", :size => 20 
			end
			pdf.bounding_box([ 396, 418], :width => 430, :height => 30) do
				pdf.text "X", :color => "ff0000", :size => 20 
			end		


			# Lender form
			pdf.bounding_box([ 230, 320], :width => 430, :height => 30) do
				pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			end

			pdf.bounding_box([ 120, 290], :width => 430, :height => 30) do
				pdf.text records_array.address_street.to_s , :color => "ff0000" 
			end

			pdf.bounding_box([ 110, 264], :width => 430, :height => 30) do
				pdf.text records_array.address_city.to_s , :color => "ff0000" 
			end

			pdf.bounding_box([ 290, 264], :width => 430, :height => 30) do
				pdf.text records_array.address_state.to_s , :color => "ff0000" 
			end

			pdf.bounding_box([ 440, 264], :width => 530, :height => 30) do
				pdf.text records_array.address_zip.to_s , :color => "ff0000" 
			end

			pdf.bounding_box([ 110, 240], :width => 430, :height => 30) do
				pdf.text "Attn :", :color => "ff0000" 
			end

			pdf.bounding_box([ 360, 208], :width => 430, :height => 30) do
				pdf.text "Memo ", :color => "ff0000" 
			end

			# Acknowledgement
			pdf.bounding_box([ 360, 110], :width => 430, :height => 30) do
				pdf.text "Lender ", :color => "ff0000" 
			end

			pdf.bounding_box([ 260, 210], :width => 430, :height => 30) do
				# pdf.text "Lender ", :color => "ff0000" 
			end

			pdf.bounding_box([ 210, 58], :width => 430, :height => 30) do
				pdf.text rec_set[1].strftime('%b %d, %Y'), :color => "ff0000" 
			end


			# BANK NAME 


			# # page 11
			# ##########################################################################################
			pdf.start_new_page

    # 			pdf.bounding_box([0, 90],{ :width => 600, :height => 100 }) do
				# pdf.fill_color "ff0000"
				# pdf.rectangle [0, 700], 600, 2
				# pdf.fill_rectangle [10, 100],0, 0
				
				# pdf.fill_color "00ff00"
				# pdf.rectangle [0, 600], 600, 2
				# pdf.fill_rectangle [10, 100],0, 0

				# pdf.fill_color "0000ff"
				# pdf.rectangle [0, 500], 600, 2
				# pdf.fill_rectangle [10, 100],0, 0

				# pdf.fill_color "ff0000"
				# pdf.rectangle [0, 400], 600, 2
				# pdf.fill_rectangle [10, 100],0, 0
				
				# pdf.fill_color "00ff00"
				# pdf.rectangle [0, 300], 600, 2
				# pdf.fill_rectangle [10, 100],0, 0

				# pdf.fill_color "0000ff"
				# pdf.rectangle [0, 200], 600, 2
				# pdf.fill_rectangle [10, 100],0, 0

				# pdf.fill_color "ff0000"
				# pdf.rectangle [0, 100], 600, 2
				# pdf.fill_rectangle [10, 100],0, 0
				
				# pdf.fill_color "00ff00"
				# pdf.rectangle [0, 0], 600, 2
				# pdf.fill_rectangle [10, 100],0, 0

				# pdf.fill_color "000000"
	   # 		     end



			# pdf.bounding_box([-30, 690], :width => 100, :height => 100, :at => [200, 550]) do
			#           pdf.fill_color "000000"
			# 	pdf.transparent(1.0, 0.2) do 
			# 		pdf.image open("app/assets/page_files/con_9_page_11.png"), :fit => [580, 960], :at => [0, 160]
			# 	end
			#          pdf.fill_color "000000"
			# end

			pdf.bounding_box([ 240, 636], :width => 430, :height => 30) do
				pdf.text "Attn :", :color => "ff0000" 
			end

			pdf.bounding_box([ 240, 614], :width => 430, :height => 30) do
				pdf.text "Attn :", :color => "ff0000" 
			end


			pdf.bounding_box([ 16, 536], :width => 430, :height => 30) do
				pdf.text "X", :color => "ff0000", :size => 20 
			end		
			pdf.bounding_box([ 16, 514], :width => 430, :height => 30) do
				pdf.text "X", :color => "ff0000", :size => 20 
			end		
			pdf.bounding_box([ 16, 490], :width => 430, :height => 30) do
				pdf.text "X", :color => "ff0000", :size => 20 
			end	




			pdf.bounding_box([ 30, 434], :width => 430, :height => 30) do
				pdf.text "X", :color => "ff0000", :size => 20 
			end		
			pdf.bounding_box([ 186, 434], :width => 430, :height => 30) do
				pdf.text "X", :color => "ff0000", :size => 20 
			end		
			pdf.bounding_box([ 336, 434], :width => 430, :height => 30) do
				pdf.text "X", :color => "ff0000", :size => 20 
			end		



			pdf.bounding_box([ 230, 222], :width => 430, :height => 30) do
				pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			end
			pdf.bounding_box([ 250, 176], :width => 430, :height => 30) do
				pdf.text rec_set[1].strftime('%b %d, %Y'), :color => "ff0000" 
			end




			pdf.bounding_box([ 230, 80], :width => 430, :height => 30) do
				pdf.text rec_set[2] + " " + rec_set[3], :color => "ff0000" 
			end
			pdf.bounding_box([ 250, 34], :width => 430, :height => 30) do
				pdf.text rec_set[1].strftime('%b %d, %Y'), :color => "ff0000" 
			end




			# # # page 12
			# # # ##########################################################################################
			pdf.start_new_page

			# pdf.bounding_box([-30, 680], :width => 100, :height => 100, :at => [200, 550]) do
			#           pdf.fill_color "000000"
			# 	pdf.transparent(1.0, 0.2) do 
			# 		pdf.image open("app/assets/page_files/con_9_page_12.png"), :fit => [600, 1000], :at => [0, 160]
			# 	end
			#          pdf.fill_color "000000"
			# end


			# # # page 13
			# # # ##########################################################################################
			pdf.start_new_page


			pdf.bounding_box([-10, 690], :width => 100, :height => 100, :at => [200, 550]) do
			          pdf.fill_color "000000"
				pdf.transparent(1.0, 0.2) do 
					pdf.image open("app/assets/page_files/con_9_page_13.png"), :fit => [570, 960], :at => [0, 160]
				end
			         pdf.fill_color "000000"
			end



			# ##########################################################################################













		end



















	end
end

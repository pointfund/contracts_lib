module PdfPageHelper
	require 'date'
	class SendLetter < Prawn::Document 
		def initialize(pdf,item_array, place_array,records_array)
			page_letter(pdf,item_array,place_array,records_array)

		end


		def page_letter(pdf,item_array,place_array,records_array)
			# stroke_color "f0ffc1"
			# side logo 
			pdf.bounding_box([-30, 720], :width => 100, :height => 100, :at => [200, 550]) do
	            # pdf.rectangle [120, 100], 4, 700
	            # pdf.rectangle [120, 100],120,100
	            pdf.fill_color "ff0000"
	            # pdf.fill_rectangle [200, 10],0, 0
				# pdf.fill { rectangle [200, 100], 100, 100 }
				pdf.transparent(1.0, 0.2) do 
					#pdf.image open("app/assets/images/point_logo.png"), :fit => [500, 500], :at => [180, -100]#, 
					pdf.image open("app/assets/images/logo_page.png"), :fit => [600, 1000], :at => [0, 160]
				end
               # pdf.font("app/assets/font/Spirax-Regular.ttf")
	           pdf.fill_color "000000"
	           # pdf.font "Arial", size: 11
	           # pdf.image open("app/assets/images/point_logo.png"), :fit => [130, 135]
	           # pdf.image open("app/assets/images/logo_page.png"), :fit => [600, 1000]
			   # , :color => "00ff00"
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
			groupName = groupName.localtime.strftime('  %b %d, %Y')
			say_date = my_string.gsub('#{current_date}', groupName )

			full_name = records_array.client_first_name + " " + records_array.client_last_name

			head_name = full_name
			full_name_show = head_name.gsub('#{full_name}', head_name )

			comp_address =  records_array.address_street;
			comp_address_state = records_array.address_city + ", " + records_array.address_state + " " + records_array.address_zip;

			intro = item_array[4]
			intro = intro.gsub('#{nick_name}', full_name )

			para_A = item_array[5].to_s 
			para_A = para_A.sub('#{full_name}', full_name )

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
				# move_l = place_array[step][0].to_f
				# move_r = 750.00
				var_x = place_array[step][0]
				var_y = place_array[step][1]
				# adjust_x = var_x + -50
				# adjust_y = var_y + 300
				# var_x = 20.0
				# var_y = 10.0
				# var_y = var_y
				# pdf.bounding_box([ adjust_x, adjust_y],{ :width => 300, :height => 20}) do
					
				pdf.indent 320, 0 do
					pdf.stroke_color 'FFFF00'
					pdf.stroke_bounds
					pdf.text_box step.to_s + " - : " + place_array[step][0].to_s + " : w, " + place_array[step][1].to_s + " : h, ", {:size => 12, :color => "ff0000" }
					# pdf.text 
					# pdf.text place_array[step][1].to_s
					pdf.line_to [var_x, var_y]
				end
					# pdf.rectangle [var_x, var_y], 100, 200
				# end
			end
			# play = 1
			# play = place_array[step][0].to_i + 10
			# play = play.to_s

			# @parts.page_area 



    		# page layout 
			pdf.bounding_box([ place_array[step][0], place_array[step][1]],{ :width => 400, :height => tag_height}) do
				# var_x = place_array[step][0]
				# var_y = place_array[step][1]	
				# pdf.bounding_box([ place_array[step][0], place_array[step][1] ] ), { :width => 200, :height => 300}) do
				# pdf.font "/app/assets/fonts/Spirax-Regular.ttf"
				# pdf.text item_array[step], {:color => "00ff00"}
				pdf.text say_date, {:color => "00ff00"}
				# pdf.text place_array[step][0].to_s
				# pdf.text place_array[step][1].to_s

				get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
	        end
			
			# client info
			# step = up_one(step)  
			# pdf.bounding_box( [ place_array[step][0], place_array[step][1] ] ),{ :width => 200, :height => 30}) do
			# pdf.bounding_box([ place_array[step][0], place_array[step][1]],{ :width => 400, :height => tag_height}) do
				# get_page_loc(step, place_array, pdf);
				# get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
			# end
			step = up_one(step)

			# Client info 2
			pdf.bounding_box([  place_array[step][0], place_array[step][1] ], :width => 400, :height => tag_height) do
				pdf.text records_array.loan_name , {:color => "000000"}
				# get_page_loc(step, place_array, pdf, var_x, var_y);
				get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )

			end
			step = up_one(step)  

			# info 3
			pdf.bounding_box([ place_array[step][0], place_array[step][1] ], :width => 400, :height => 30) do
			# 	pdf.text full_name_show , {:color => "000000"}
				pdf.text records_array.client_first_name , {:color => "000000"}
				get_page_loc(step, place_array, pdf, place_array[step][0], place_array[step][1] )
			end

			step = up_one(step)			
			# #Address 4
			pdf.bounding_box([ place_array[step][0], place_array[step][1]], :width => 400, :height => 30) do
				pdf.font "OpenSans", size: 10 
				pdf.text comp_address + " \n" + comp_address_state
				get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end

			step = up_one(step)
			# #intro 5
			pdf.bounding_box([ place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
				pdf.text intro
				get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
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
				get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			
			end
			step = up_one(step) 
			#para 03 8
			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
				pdf.text item_array[step]
				get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
			end
			step = up_one(step)
			# #ender 9
			pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 430, :height => 30) do
				pdf.text item_array[step]
				get_page_loc(step, place_array, pdf, place_array[step][0] , place_array[step][1] )
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

		# page 1 book 01
		# def page_letterB(pdf,item_array,place_array,records_array)
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

	 #        step = 0
	 #        def up_one(step)
	 #        	step = step + 1
	 #        	return step	
	 #        end

		#     def number_to_currency(num)
		# 	  "$#{num.to_s.gsub(/\d(?=(...)+$)/, '\0,')}"
		# 	end

		# 	current_date = records_array.client_first_name.to_s
		# 	my_string = item_array[0].to_s
		# 	groupName = Time.new
		# 	groupName = groupName.localtime.strftime('  %b %d, %Y')
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

		# 	para_B = item_array[6].to_s
		# 	para_B = para_B.sub('#{loan_rate}', records_array.stated_rate.to_s )

		# 	para_B = para_B.sub('#{total_loan}', number_to_currency(records_array.total_amount) )		
		# 	st_date = records_array.repay_start.strftime("%B")
		# 	para_B = para_B.sub('#{start_month}', st_date )	

		# 	sign_to = item_array[9].to_s 
		# 	sign_to = sign_to.sub('#{full_name}', full_name )

   
		# 	pdf.bounding_box([ place_array[step][0], place_array[step][1]],{ :width => 200, :height => 300}) do
	 #          pdf.text say_date, {:color => "00ff00"}
	 #        end
		# 	step = up_one(step)

		# 	# 	Client info 2
		# 	pdf.bounding_box([  place_array[step][0], place_array[step][1] ], :width => 200, :height => 150) do

		# 		pdf.text records_array.loan_name , {:color => "000000"}
		# 	end
		# 	step = up_one(step)  

		# 	# info 3
		# 	pdf.bounding_box([ place_array[step][0], place_array[step][1] ], :width => 200, :height => 150) do
		# 		pdf.text full_name_show , {:color => "000000"}
		# 		# pdf.text records_array.client_last_name , {:color => "000000"}
		# 	end

		# 	step = up_one(step)			
		# 	#Address 4
		# 	pdf.bounding_box([ place_array[step][0], place_array[step][1]], :width => 200, :height => 150) do
		# 		pdf.font "OpenSans", size: 10 
		# 		pdf.text comp_address
		# 		pdf.text comp_address_state
		# 	end

		# 	step = up_one(step)
		# 	#intro 5
		# 	pdf.bounding_box([ place_array[step][0], place_array[step][1]], :width => 430, :height => 150) do
		# 		pdf.text intro
		# 	end
		# 	step = up_one(step)
		# 	#para 01 6
		# 	pdf.bounding_box([ place_array[step][0], place_array[step][1]], :width => 430, :height => 150) do
		# 		# pdf.text item_array[step]
		# 		# pdf.text item_array[5]
		# 		pdf.text para_A 
		# 	end
		# 	step = up_one(step)
		# 	#para 02 7
		# 	pdf.bounding_box([ place_array[step][0], place_array[step][1] ], :width => 430, :height => 150) do
		# 		pdf.text para_B
		# 		# pdf.text item_array[step]
		# 	end
		# 	step = up_one(step) 
		# 	#para 03 8
		# 	pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 430, :height => 150) do
		# 		pdf.text item_array[step]
		# 	end
		# 	step = up_one(step)
		# 	#ender 9
		# 	pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 430, :height => 150) do
		# 		pdf.text item_array[step]
		# 	end
		# 	step = up_one(step)
		# 	#sign to 10
		# 	pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 430, :height => 150) do
		# 		# pdf.text item_array[step]
		# 		pdf.text sign_to
		# 	end
		# 	step = up_one(step)
		# 	#sign from 11
		# 	pdf.bounding_box([place_array[step][0], place_array[step][1]], :width => 430, :height => 150) do
		# 		pdf.text item_array[10]
		# 	end
		# end















	end
end

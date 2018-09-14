module PdfFontsHelper
	class AddFontsPdf < Prawn::Document 
		def initialize(pdf)
			loadfonts(pdf)

		end

		def loadfonts(pdf)

			pdf.font_families.update("Spirax" => {
    			:normal => Rails.root.join("app/assets/fonts/Spirax-Regular.ttf")
  				})
			# pdf.font "Spirax"
			pdf.font_families.update("OpenSans" => {
    			:normal => Rails.root.join("app/assets/fonts/OpenSans-Regular.ttf"),
    			:bold => Rails.root.join("app/assets/fonts/OpenSans-Bold.ttf")
  				})
			# pdf.font "OpenSans"
			pdf.font_families.update("PTSerif" => {
    			:normal => Rails.root.join("app/assets/fonts/PT_Serif-Web-Regular.ttf"),
    			:bold => Rails.root.join("app/assets/fonts/PT_Serif-Web-Bold.ttf")
  				})
  			pdf.font "PTSerif"
			pdf.font_families.update("Tinos" => {
    			:normal => Rails.root.join("app/assets/fonts/Tinos-Regular.ttf"),
    			:bold => Rails.root.join("app/assets/fonts/Tinos-Bold.ttf"),
    			:italic => Rails.root.join("app/assets/fonts/Tinos-Italic.ttf")
  				})
  			pdf.font "Tinos"
  			
			pdf.font_families.update("times" => {
    			:normal => Rails.root.join("app/assets/fonts/times.ttf"),
    			:bold => Rails.root.join("app/assets/fonts/times_bd.ttf"),
    			:italic => Rails.root.join("app/assets/fonts/times_i.ttf")
    			})
  			pdf.font "times"
      pdf.font_families.update("arial" => {
          :normal => Rails.root.join("app/assets/fonts/arial.ttf"),
          :bold => Rails.root.join("app/assets/fonts/arialbd.ttf"),
          :italic => Rails.root.join("app/assets/fonts/ariali.ttf")
          })
        pdf.font "arial"

		end

	


	end
end